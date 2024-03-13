package com.yuntongxun.common.zk;

import com.yuntongxun.ai.service.ModuleService;
import com.yuntongxun.common.CacheManager;
import com.yuntongxun.common.Constants;
import com.yuntongxun.common.hash.ConsistentHash;
import com.yuntongxun.common.hash.Node;
import com.yuntongxun.common.zk.impl.AIAppZkChildHandler;
import com.yuntongxun.common.zk.impl.AIZkChildHandler;
import com.yuntongxun.entity.ModuleInfo;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * @program:
 * @description:
 * @author: xuxm
 * @create: 2019-11-25
 */
@Component
public class ZkServer {

    final static Logger logger = LoggerFactory.getLogger(AIZkChildHandler.class);


    @Autowired
    private ZkProperties zkProperties;

    @Autowired
    private RegistProvider registProvider;

    @Autowired
    private ModuleService moduleService;

    @Value("${server.port}")
    private int port;

    private ZooKeeperRegistContext context;

    void init() throws Exception {

        String ip = getLocalIp();
        logger.info("本服务ip[{}],端口port[{}]", ip, port);
        // 初始化zk
        String rootPath = Context.ZK_ROOT_NODE_PATH + Context.GROUP_ID;
        String parentPath = rootPath + Context.SEPARATOR + CacheManager.getGeneraConfig("zk_server_path");
        ServerData serverData = new ServerData();
        ZkClient zkClient = ZkClient.getInstance();
        String serverPath = parentPath + Context.SEPARATOR + zkProperties.getModuleNo();
        if(zkClient.checkExist(serverPath)) {
            throw new RuntimeException("KeeperErrorCode = NodeExists for "+serverPath);
        }
        serverData.setIp(ip);
        serverData.setPort(String.valueOf(port));
        serverData.setServerPath(serverPath);
        context = new ZooKeeperRegistContext(serverPath, serverData, zkClient);
        registProvider.regist(context);
        zkClient.subscribeMyselfChanges(parentPath, serverData, new AIAppZkChildHandler());
        String listenServicePath = CacheManager.getGeneraConfig("zk_listen_path");
        if (StringUtils.isNotEmpty(listenServicePath)) {
            String[] listenPaths = listenServicePath.split(",");
            for (String path : listenPaths) {
                zkClient.subscribeChildChanges(rootPath + Context.SEPARATOR + path, null, new AIZkChildHandler());
            }
        }
        List<ModuleInfo> modules = new ArrayList<>();

        // 根据YTX_AI_QUEUE 存活的节点更新ytx_module_info 服务状态，不存在则插入，存在则更新
        for (String moduleNo  : CacheManager.serverDataMapping.keySet()) {
            ServerData serverData1 = CacheManager.getServerData(moduleNo);
            ModuleInfo moduleInfo = new ModuleInfo();
            moduleInfo.setModuleNo(serverData1.getServerPath().substring(serverData1.getServerPath().lastIndexOf(Context.SEPARATOR) + 1));
            moduleInfo.setModuleName(Constants.YTX_AI_QUEUE);
            moduleInfo.setIp(serverData1.getIp());
            moduleInfo.setPort(Integer.valueOf(serverData1.getPort()));
            moduleInfo.setStatus(1);
            modules.add(moduleInfo);
            Node node = new Node(moduleInfo.getIp(),moduleInfo.getModuleNo(),moduleInfo.getPort());
            ConsistentHash.getInstance().add(node);
        }
        ModuleInfo module = new ModuleInfo();
        module.setModuleNo(zkProperties.getModuleNo());
        module.setIp(ip);
        module.setPort(port);
        module.setModuleName(Constants.YTX_AIAPP_QUEUE);
        module.setStatus(1);
        modules.add(module);

        moduleService.batchSaveOrUpdate(modules);
        moduleService.reallocate();
    }

    void destory() {
        if (this.registProvider != null) {
            this.registProvider.unregist(this.context);
        }
        if (context.getZkClient() != null) {
            context.getZkClient().getCurator().close();
        }

    }

    /**
     * 获取服务器的ip
     *
     * @return
     */
    public static String getLocalIp() throws SocketException {
        String ip = "";
        // 遍历服务器的网卡地址
        for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements(); ) {
            NetworkInterface intf = en.nextElement();
            for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements(); ) {
                InetAddress inetAddress = enumIpAddr.nextElement();
                if (!inetAddress.isLoopbackAddress() && !inetAddress.isLinkLocalAddress() && inetAddress.isSiteLocalAddress()) {
                    ip = inetAddress.getHostAddress();
                }
            }
        }
        return ip;
    }
}