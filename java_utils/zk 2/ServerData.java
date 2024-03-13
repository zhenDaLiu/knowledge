package com.yuntongxun.common.zk;

/**
 *
 */

import lombok.Data;
import org.ming.sample.util.TextUtil;

import java.io.UnsupportedEncodingException;

/**
 * @author chao
 */
@Data
public class ServerData {

    public static final String separator = "|";

    private String ip; // inner ip

    private String port; // inner tcp port

    private String serverPath; // zk path eg: /implus4/default/YTX_IM_QUEUE/58001

    /**
     *
     */
    public ServerData() {
        super();
    }

    /**
     * @param ip
     * @param port
     */
    public ServerData(String ip, String port) {
        super();
        this.ip = ip;
        this.port = port;
    }

    public ServerData(String[] attr) {
        try {
            this.ip = attr[0];
            this.port = attr[1];
            this.serverPath = attr[2];
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ServerData(String zkData) {
        try {
            String[] attrs = TextUtil.split(zkData, separator);
            for (int i = 0; i < attrs.length; i++) { // 按顺序赋值
                String value = attrs[i];
                switch (i) {
                    case 0:
                        this.ip = value;
                        break;
                    case 1:
                        if (value != null && value.length() > 0) {
                            this.port = value;
                        }
                        break;
                    case 2:
                        this.serverPath = value;
                        break;
                    default:
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public byte[] getZkDataBytes() {
        String zkData = new StringBuilder(getIp()).append(separator).append(getPort()).append(separator)
                .append(getServerPath()).toString();
        try {
            return zkData.getBytes("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String toString() {
        return "ServerData [ip=" + ip + ", port=" + port + ", serverPath=" + serverPath + "]";
    }


    public static enum ModuleStatus {
        PREPARE("0"), //准备升级
        NORMAL("1"),  //正常
        READY("2");   //可以升级

        private String status;

        private ModuleStatus(String status) {
            this.status = status;
        }

        public static ModuleStatus getModuleStatus(String status) {
            if (status == null || status == "") {
                return NORMAL;
            }
            for (ModuleStatus mStatus : ModuleStatus.values()) {
                if (mStatus.getStatus().equals(status)) {
                    return mStatus;
                }
            }
            return PREPARE;
        }

        public String getStatus() {
            return status;
        }
    }

}
