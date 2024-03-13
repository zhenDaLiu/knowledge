package com.yuntongxun.common.zk.impl;

import cn.hutool.http.HttpUtil;
import com.yuntongxun.common.CacheManager;
import com.yuntongxun.common.Constants;
import com.yuntongxun.common.zk.IZkChildHandler;
import com.yuntongxun.common.zk.ServerData;
import com.yuntongxun.common.zk.ZkClient;
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
public class AIAppZkChildHandler implements IZkChildHandler {

    final static Logger log = LoggerFactory.getLogger(AIAppZkChildHandler.class);

    @Override
    public void handleChildChange(String parentPath, ZkClient zkClient, ServerData serverData, PathChildrenCacheEvent event) throws Exception {
        if (event.getType().equals(PathChildrenCacheEvent.Type.CHILD_REMOVED)) {
            if (event.getData().getPath().equals(serverData.getServerPath())) {
                log.info("lost connection from zookeer,start to retry register");
                zkClient.write(event.getData().getPath(), serverData.getZkDataBytes());
            } else {
                log.info("AIApp[{}] lost connection from zookeer", event.getData().getPath());
                ServerData data = new ServerData(new String(event.getData().getData()));
                StringBuffer sb = new StringBuffer("http" + "://");
                sb.append(data.getIp()).append(":").append(data.getPort()).append(Constants.API_AIAPP_PING);
                String resp = "";
                try {
                    resp = HttpUtil.get(sb.toString());
                } catch (Exception e) {
                }
                if("2".equals(CacheManager.getGeneraConfig("aiapp_convert_job_flag"))) {
                    log.info("[aiapp_convert_job_flag]-->[{}]，not to convert video",2);
                    return;
                }
                if (!"OK".equals(resp)) {
                    log.warn("AIApp[{}] not alive,start to convertAIAppJob and set the module status to abnormal", event.getData().getPath());
                    ModuleMonitorTask task = SpringBeanUtil.getBean("moduleMonitorTask", ModuleMonitorTask.class);
                    task.convertAIAppJob(event, 2);
                }
            }
        }
    }
}