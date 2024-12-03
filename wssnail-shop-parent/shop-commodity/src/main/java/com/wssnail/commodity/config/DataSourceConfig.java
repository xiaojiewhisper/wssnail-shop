//package com.wssnail.commodity.config;
//
//import com.zaxxer.hikari.HikariDataSource;
//import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.Primary;
//import org.springframework.util.StringUtils;
//
//import javax.sql.DataSource;
//
//@Configuration
//public class DataSourceConfig {
//
//    @Bean
//    @Primary
//    @ConfigurationProperties("spring.datasource")
//    public DataSourceProperties dataSourcePropertiesOne() {
//        return new DataSourceProperties();
//    }
//
//    @Bean
//    @Primary
//    @ConfigurationProperties("spring.datasource.hikari")
//    public HikariDataSource dataSourceOne(DataSourceProperties properties) {
//        return createHikariDataSource(properties);
//    }
//
//    @SuppressWarnings("unchecked")
//    private static <T> T createHikariDataSource(DataSourceProperties properties, Class<? extends DataSource> type) {
//        return (T) properties.initializeDataSourceBuilder().type(type).build();
//    }
//
//    private static HikariDataSource createHikariDataSource(DataSourceProperties properties) {
//        HikariDataSource dataSource = createHikariDataSource(properties, HikariDataSource.class);
//        if (StringUtils.hasText(properties.getName())) {
//            dataSource.setPoolName(properties.getName());
//        }
//        return dataSource;
//    }
//}
