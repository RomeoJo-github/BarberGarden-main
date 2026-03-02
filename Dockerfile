# ========== 1단계: WAR 빌드 ==========
FROM maven:3.8.6-eclipse-temurin-8-alpine AS builder

WORKDIR /build

# pom.xml 먼저 복사 후 의존성 다운로드 (캐시 활용)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# 소스 복사 후 패키징
COPY src ./src
RUN mvn package -DskipTests -B

# ========== 2단계: Tomcat 실행 ==========
FROM tomcat:8.5-jdk8-temurin-jammy

# ROOT 경로(/)로 서비스하기 위해 WAR를 ROOT.war로 배포
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /build/target/app-*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
