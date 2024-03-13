package com.yuntongxun.common.zk;

import org.apache.curator.framework.recipes.cache.PathChildrenCacheEvent;

public interface IZkChildHandler {

    void handleChildChange(String parentPath,ZkClient zkClient, ServerData serverData, PathChildrenCacheEvent event) throws Exception;
}
