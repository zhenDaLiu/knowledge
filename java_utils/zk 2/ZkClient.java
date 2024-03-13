package com.yuntongxun.common.zk;

import com.yuntongxun.common.CacheManager;
import com.yuntongxun.common.Constants;
import lombok.Data;
import org.apache.curator.CuratorZookeeperClient;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.cache.ChildData;
import org.apache.curator.framework.recipes.cache.PathChildrenCache;
import org.apache.curator.framework.state.ConnectionState;
import org.apache.curator.framework.state.ConnectionStateListener;
import org.apache.curator.retry.RetryForever;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.data.Stat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * @program:
 * @description:
 * @author: xuxm
 * @create: 2019-11-23
 */
@Data
public class ZkClient {

    final static Logger log = LoggerFactory.getLogger(ZkClient.class);

    private final int CONNECT_TIMEOUT = 15000;
    //private final int RETRY_TIME = Integer.MAX_VALUE;
    private final int RETRY_INTERVAL = 1000;
    private final int SESSION_TIMEOUT = 2000;

    private CuratorFramework curator;

    private volatile static ZkClient instance;

    private CuratorFramework newCurator(String zkServers) {
        return CuratorFrameworkFactory.builder().connectString(zkServers)
                // .retryPolicy(new RetryNTimes(RETRY_TIME, RETRY_INTERVAL))
                .retryPolicy(new RetryForever(RETRY_INTERVAL))
                .sessionTimeoutMs(SESSION_TIMEOUT)
                .connectionTimeoutMs(CONNECT_TIMEOUT).build();
    }

    private ZkClient() {
        if (curator == null) {
            curator = newCurator(CacheManager.getGeneraConfig("zk_conncet_path"));
            curator.getConnectionStateListenable().addListener(new ConnectionStateListener() {
                @Override
                public void stateChanged(CuratorFramework client, ConnectionState state) {
                    if (state == ConnectionState.LOST) {
                        //连接丢失
                        log.info("lost session with zookeeper");
                    } else if (state == ConnectionState.CONNECTED) {
                        //连接新建
                        log.info("connected with zookeeper");
                    } else if (state == ConnectionState.RECONNECTED) {
                        log.info("reconnected with zookeeper");
                        //连接重连
                    }
                }
            });
            curator.start();
        }
    }

    public static ZkClient getInstance() {
        if (instance == null) {
            synchronized (CuratorZookeeperClient.class) {
                if (instance == null) {
                    log.info("initial CuratorZookeeperClient instance");

                    instance = new ZkClient();
                }
            }
        }
        return instance;
    }

    public String write(String path, byte[] zkData) {
        String writePath = null;
        try {

            writePath = curator.create().creatingParentsIfNeeded()
                    .withMode(CreateMode.EPHEMERAL)
                    .forPath(path, zkData);
        } catch (Exception e) {
            log.error("write data fail", e);
        }
        return writePath;
    }


    public boolean delete(String path) {
        try {
            this.curator.delete()
                    .guaranteed()  // 如果删除失败，那么在后端还是会继续删除，直到成功
                    .deletingChildrenIfNeeded()  // 子节点也一并删除，也就是会递归删除
                    .forPath(path);
            return true;
        } catch (Exception e) {
            log.error("delete for path[{}] failure..", path, e);
            return false;
        }
    }


    /**
     * 检查子节点变化
     * 包含节点和数据
     *
     * @param parentPath
     */
    public void subscribeChildChanges(String parentPath, ServerData serverData, IZkChildHandler listener) {
        // PathChildrenCache: 监听数据节点的增删改，可以设置触发的事件
        final PathChildrenCache childrenCache = new PathChildrenCache(curator, parentPath, true);
        try {
            childrenCache.start(PathChildrenCache.StartMode.BUILD_INITIAL_CACHE);
            // 列出子节点数据列表，需要使用BUILD_INITIAL_CACHE同步初始化模式才能获得，异步是获取不到的
            List<ChildData> childDataList = childrenCache.getCurrentData();
            log.info("当前节点[{}]的子节点详细数据列表：", parentPath);
            if(parentPath.contains(Constants.YTX_AI_QUEUE)) {
                for (ChildData childData : childDataList) {
                    String zkData = new String(childData.getData());
                    log.info("子节点路径：[{}]，该节点的数据为：[{}]", new String(childData.getPath()), zkData);
                    String moduleNo = childData.getPath().substring(childData.getPath().lastIndexOf(Context.SEPARATOR) + 1);

                    CacheManager.addServerData(moduleNo, new ServerData(zkData));
                }
            }

            // 添加事件监听器
            childrenCache.getListenable().addListener((curatorFramework, event) -> {
                listener.handleChildChange(parentPath, this, serverData, event);
            });
        } catch (Exception e) {
            log.error("subscribeChildChanges for path[{}] failure..", parentPath, e);
        }

    }

    /**
     * 监控本服务变化
     *
     * @param path       父节点路径  如：/ai/default/YTX_AIAPP_QUEUE
     * @param serverData
     */
    void subscribeMyselfChanges(String path, ServerData serverData, IZkChildHandler listener) {
        try {

            final PathChildrenCache childrenCache = new PathChildrenCache(curator, path, true);
            childrenCache.start(PathChildrenCache.StartMode.BUILD_INITIAL_CACHE);
            childrenCache.getListenable().addListener((curatorFramework, event) -> {
                listener.handleChildChange(path, this, serverData, event);
            });
        } catch (Exception e) {
            log.error("subscribeMyselfChanges for path[{}] failure..", path, e);
        }

    }

    public byte[] getData(String path) {
        try {
            return curator.getData().forPath(path);
        } catch (Exception e) {
            log.error("getData for path[{}] failure..", path, e);
        }
        return null;
    }

    public Stat updateDate(String path, byte[] datas) {
        Stat resultStat =null;
        try {

            resultStat = curator.setData().forPath(path, datas);
        } catch (Exception e) {
            log.error("updateDate for path[{}] failure..", path, e);
        }
        return resultStat;
    }

    public void createNode(String path) throws Exception {
        if (curator.checkExists().forPath(path) == null) {
            curator.create().creatingParentsIfNeeded().forPath(path);
        }
    }

    public int getVersion(String path) throws Exception {
        Stat stat = new Stat();
        curator.getData().storingStatIn(stat).forPath(path);
        return stat.getVersion();
    }

    public boolean checkExist(String nodePath) throws Exception {
        Stat stat = curator.checkExists().forPath(nodePath);
        if(stat == null) {
            return false;
        }else {
            return true;
        }
    }

}