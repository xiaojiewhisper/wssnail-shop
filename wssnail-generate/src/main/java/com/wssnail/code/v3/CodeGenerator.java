package com.wssnail.code.v3;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.sql.Types;
import java.util.Collections;

public class CodeGenerator {
    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:mysql://127.0.0.1:3306/shop-uaa?serverTimezone=Asia/Shanghai", "root", "root")
                .globalConfig(builder -> {
                    builder.author("snail") // 设置作者
                            .enableSwagger() // 开启 swagger 模式
                            .outputDir("D://111") // 指定输出目录
                            .dateType(DateType.ONLY_DATE) // 设置时间类型策略
                            .commentDate("yyyy-MM-dd")// 设置注释日期格式
                            .disableOpenDir();//自动打开目录
                })
                .dataSourceConfig(builder ->
                        builder.typeConvertHandler((globalConfig, typeRegistry, metaInfo) -> {
                            int typeCode = metaInfo.getJdbcType().TYPE_CODE;
                            if (typeCode == Types.SMALLINT) {
                                // 自定义类型转换
                                return DbColumnType.INTEGER;
                            }
                            return typeRegistry.getColumnType(metaInfo);
                        })
                )
                .packageConfig(builder ->
                        builder.parent("com.wssnail") // 设置父包名
                                .moduleName("uaa") // 设置父包模块名
                                .entity("po") // 设置 Entity 包名
                                .service("service") // 设置 Service 包名
                                .serviceImpl("service.impl") // 设置 Service Impl 包名
                                .mapper("mapper") // 设置 Mapper 包名
                                .xml("mappers") // 设置 Mapper XML 包名
                                .controller("controller") // 设置 Controller 包名
                                .pathInfo(Collections.singletonMap(OutputFile.xml, "D://111")) // 设置mapperXml生成路径
                )
                .strategyConfig(builder ->

                        builder.addInclude("tb_user") // 设置需要生成的表名
                                .addTablePrefix("tb_", "c_") // 设置过滤表前缀
                                .serviceBuilder()
                                .formatServiceFileName("%sService")
                                .formatServiceImplFileName("%sServiceImp")
                )
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}
