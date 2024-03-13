package com.yuntongxun.common.zk.impl;

import cn.hutool.http.HttpUtil;
import com.yuntongxun.common.CacheManager;
import com.yuntongxun.common.Constants;
import com.yuntongxun.common.exception.CCPDaoException;
import com.yuntongxun.common.hash.ConsistentHash;
import com.yuntongxun.common.hash.Node;
import com.yuntongxun.common.zk.Context;
import com.yuntongxun.common.zk.IZkChildHandler;
import com.yuntongxun.common.zk.ServerData;
import com.yuntongxun.common.zk.ZkClient;
import com.yuntongxun.entity.ModuleInfo;
import com.yuntongxun.task.ModuleMonitorTask;
import com.yuntongxun.ws.utils.spring.SpringBeanUtil;
import org.apache.curator.framework.recipes.cache.PathChildrenCacheEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @program:
 * @description:
 * @author: xuxm
 * @create: 2019-12-01
 */
public class AIZkChildHandler implements IZkChildHandler {

    final static Logger log = LoggerFactory.getLogger(AIZkChildHandler.class);

    @Override
    public void handleChildChange(String parentPath, ZkClient zkClient, ServerData serverData, PathChildrenCacheEvent event) throws Exception {

        // 通过判断event type的方式来实现不同事件的触发
        if (event.getType().equals(PathChildrenCacheEvent.Type.CHILD_ADDED)) {
            log.info("子节点：[{}] 添加成功,数据为[{}]", event.getData().getPath(), new String(event.getData().getData()));
            ServerData data = new ServerData(new String(event.getData().getData()));
            String moduleNo = event.getData().getPath().substring(event.getData().getPath().lastIndexOf(Context.SEPARATOR) + 1);
            CacheManager.addServerData(moduleNo, data);
            saveOrUpdate(data, 1);
            Node node = new Node();
            node.setIp(data.getIp());
            node.setPort(Integer.parseInt(data.getPort()));
            node.setModuleNo(moduleNo);
            ConsistentHash.getInstance().add(node);
            // 删除子节点时触发
        } else if (event.getType().equals(PathChildrenCacheEvent.Type.CHILD_REMOVED)) {
            log.info("子节点路径：[{}]删除成功", event.getData().getPath());
            String moduleNo = event.getData().getPath().substring(event.getData().getPath().lastIndexOf(Context.SEPARATOR) + 1);

            ServerData data = CacheManager.getServerData(moduleNo);
            StringBuffer sb = new StringBuffer("http" + "://");
            sb.append(data.getIp()).append(":").append(data.getPort()).append(Constants.API_AI_PING);
            String resp = "";
            try {
                resp = HttpUtil.get(sb.toString());
            } catch (Exception e) {
            }
            if (!"pong".equals(resp)) {
                ModuleMonitorTask task = SpringBeanUtil.getBean("moduleMonitorTask",ModuleMonitorTask.class);
                task.convertAIJob(event);
            }
        } else if (event.getType().equals(PathChildrenCacheEvent.Type.CHILD_UPDATED)) {
            log.info("子节点路径：[{}] 数据更新成功,新的数据为：[{}]", event.getData().getPath(), new String(event.getData().getData()));
            String moduleNo = event.getData().getPath().substring(event.getData().getPath().lastIndexOf(Context.SEPARATOR) + 1);
            CacheManager.addServerData(moduleNo, new ServerData(new String(event.getData().getData())));
        }
    }

    private void saveOrUpdate(ServerData data, int i) {
        ModuleMonitorTask task = SpringBeanUtil.getBean("moduleMonitorTask", ModuleMonitorTask.class);
        //task.convertAIJob(event);
        ModuleInfo module = new ModuleInfo();
        module.setModuleNo(data.getServerPath().substring(data.getServerPath().lastIndexOf(Context.SEPARATOR) + 1));
        module.setModuleName(Constants.YTX_AI_QUEUE);
        module.setIp(data.getIp());
        module.setPort(Integer.valueOf(data.getPort()));
        module.setStatus(i);
        try {
            task.saveOrUpdate(module);
        } catch (CCPDaoException e) {
            log.error("模块[{}] 信息保存失败", module.getModuleNo());
        }
    }
}