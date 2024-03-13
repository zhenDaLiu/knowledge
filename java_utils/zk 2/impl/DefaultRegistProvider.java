/**
 * 
 */
package com.yuntongxun.common.zk.impl;

import com.yuntongxun.common.zk.Context;
import com.yuntongxun.common.zk.RegistProvider;
import com.yuntongxun.common.zk.ServerData;
import com.yuntongxun.common.zk.ZkClient;
import com.yuntongxun.common.zk.ZooKeeperRegistContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;

/**
 * @author chao
 */
@Component
public class DefaultRegistProvider implements RegistProvider {

	public static final Logger logger = LogManager.getLogger(DefaultRegistProvider.class);

    public DefaultRegistProvider() {
		super();
	}

	@Override
	public void regist(Context context) {
		logger.debug("start regist...");
        try {
            ZooKeeperRegistContext registContext = (ZooKeeperRegistContext) context;
            ZkClient zkClient = registContext.getZkClient();
            ServerData serverData = registContext.getServerData();
            String serverPath = serverData.getServerPath();
            zkClient.write(serverPath, serverData.getZkDataBytes());
            logger.info("{} regist success.", serverPath);
		} catch (Exception e) {
			logger.error("DefaultRegistProvider#regist", e);
		}
	}

	@Override
	public void unregist(Context context) {
		ZooKeeperRegistContext registContext = (ZooKeeperRegistContext) context;
		ZkClient zkClient = registContext.getZkClient();
		if (zkClient == null) {
			return;
		}

		zkClient.delete(registContext.getServerPath());
		logger.info("{} unregist success.", registContext.getServerPath());
	}

	@Override
	public void changeData(Context context) {
		logger.debug("start change data...");
		ZooKeeperRegistContext registContext = (ZooKeeperRegistContext) context;
		ZkClient zkClient = registContext.getZkClient();
		if (zkClient == null) {
			logger.debug("zkClient is null...");
			return;
		}

		String serverPath = registContext.getServerPath();
		ServerData serverData = registContext.getServerData();

		try {
			zkClient.write(serverPath, serverData.getZkDataBytes());
			logger.info("{} change data [{}] success.", serverPath, serverData);
		}  catch (Exception e) {
			logger.error("DefaultRegistProvider#changeData", e);
		}
	}
}
