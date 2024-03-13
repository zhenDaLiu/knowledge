package com.yuntongxun.common.zk;

public interface RegistProvider {

    public void regist(Context context);

    public void unregist(Context context);

    public void changeData(Context context);
}
