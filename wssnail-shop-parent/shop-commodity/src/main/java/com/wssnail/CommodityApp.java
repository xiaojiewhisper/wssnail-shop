package com.wssnail;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan("com.wssnail.commodity.mapper")
@EnableTransactionManagement
@EnableDiscoveryClient
public class CommodityApp {
    public static void main(String[] args) {

        SpringApplication.run(CommodityApp.class,args);
    }
}