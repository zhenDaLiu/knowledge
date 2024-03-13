package com.yuntongxun.common.zk;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @program:
 * @description: zk配置
 * @author: xuxm
 * @create: 2019-11-23
 */
@Data
@Component
@ConfigurationProperties(prefix = "curator")
public class ZkProperties {

    /**
     * 模块编号
     */
    private String moduleNo;

   /* private String serverPath;

    *//**
     * 重试的最大次数
     *//*
    private int maxRetries;

    *//**
     * 重试等待的初始时间
     *//*
    private int baseSleepTimeMs;

    *//**
     * 连接地址
     *//*
    private String connectString;

    *//**
     * 会话超时时间
     *//*
    private int sessionTimeoutMs;

    *//**
     * 连接超时时间
     *//*
    private int connectionTimeoutMs;

    *//**
     * 命名空间
     *//*
    private String namespace;

    *//**
     * 重试间隔时间
     *//*
    private int retryIntervalMs;

    private String listenServicePath;*/
}