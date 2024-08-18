# Docker 镜像构建
FROM maven:3.5-jdk-8-alpine as builder

# 指定工作目录
WORKDIR /app
# 将文件复制到容器里
COPY pom.xml .
COPY src ./src
# 方案一：用本地打的包
# COPY target ./target
# 方案二：容器内打包,并跳过测试用例
RUN mvn package -DskipTests

# 启动服务
#   -- 指定 application-prod.yml 启动
CMD ["java","-jar","/app/target/SprintBoot-Template-0.0.1-SNAPSHOT.jar","--spring.profiles.active=prod"]
