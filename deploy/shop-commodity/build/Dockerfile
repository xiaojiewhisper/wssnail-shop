## 基础镜像
FROM openjdk:17-slim

## 作者
LABEL org.opencontainers.image.authors="snail"

## 定义参数

## 创建并进入工作目录
RUN mkdir -p /snail
WORKDIR /snail

## maven 插件构建时得到 buildArgs 种的值
COPY target/shop-commodity.jar app.jar

## 设置 TZ 时区
## 设置 JAVA_OPTS 环境变量，可通过 docker run -e "JAVA_OPTS=" 进行覆盖
ENV TZ=Asia/Shanghai JAVA_OPTS="-Xms512m -Xmx512m"

## 暴露端口
EXPOSE 8090

## 容器启动命令
## CMD 第一个参数之后的命令可以在运行时被替换
CMD java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /snail/app.jar
