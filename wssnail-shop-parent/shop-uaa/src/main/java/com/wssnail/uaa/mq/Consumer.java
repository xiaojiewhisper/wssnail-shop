//package com.wssnail.uaa.mq;
//
//import com.alibaba.fastjson.JSON;
//import com.wssnail.uaa.po.LoginLog;
//import com.wssnail.uaa.service.LoginLogService;
//import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
//import org.apache.rocketmq.spring.core.RocketMQListener;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//@Component
//@RocketMQMessageListener(topic = "login-log",consumerGroup = "login-log")
//public class Consumer implements RocketMQListener<String> {
//
//    @Autowired
//    private LoginLogService loginLogService;
//    @Override
//    public void onMessage(String s) {
//        LoginLog loginLog = JSON.parseObject(s, LoginLog.class);
//        loginLogService.save(loginLog);
//    }
//}
