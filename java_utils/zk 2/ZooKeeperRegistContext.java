/**
 * 
 */
package com.yuntongxun.common.zk;

/**
 * @author chao
 */
public class ZooKeeperRegistContext extends Context {

	private ZkClient zkClient;
	private String serverPath;
	private ServerData serverData;

	public ZooKeeperRegistContext(String serverPath, ServerData serverData, ZkClient zkClient) {
		if (!serverPath.startsWith(ZK_ROOT_NODE_PATH)) {
			this.serverPath = ZK_ROOT_NODE_PATH + SEPARATOR + serverPath;
		} else {
			this.serverPath = serverPath;
		}
		this.serverData = serverData;
		this.zkClient = zkClient;

		if (this.serverData != null) {
			this.serverData.setServerPath(this.serverPath);
		}
	}

	/**
	 * @return the serverPath
	 */
	public String getServerPath() {
		return serverPath;
	}

	/**
	 * @return the zkClient
	 */
	public ZkClient getZkClient() {
		return zkClient;
	}

	/**
	 * @param zkClient
	 *            the zkClient to set
	 */
	public void setZkClient(ZkClient zkClient) {
		this.zkClient = zkClient;
	}

	/**
	 * @param serverPath
	 *            the serverPath to set
	 */
	public void setServerPath(String serverPath) {
		this.serverPath = serverPath;
	}

	/**
	 * @return the serverData
	 */
	public ServerData getServerData() {
		return serverData;
	}

	/**
	 * @param serverData
	 *            the serverData to set
	 */
	public void setServerData(ServerData serverData) {
		this.serverData = serverData;
	}

}
