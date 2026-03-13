# ========== 1단계: WAR 빌드 ==========
FROM maven:3.8.8-eclipse-temurin-11-alpine AS builder

WORKDIR /build

# 소스 전체 복사 후 패키징
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests -B

# ========== 2단계: Tomcat 실행 ==========
FROM tomcat:9.0-jdk11-temurin-jammy

# ROOT 경로(/)로 서비스하기 위해 WAR를 ROOT.war로 배포
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /build/target/app-*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
