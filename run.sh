#!/bin/bash
# BarberGarden 프로젝트 실행 스크립트 (Git Bash)

echo "========================================"
echo "BarberGarden 프로젝트 실행"
echo "========================================"
echo ""

# Java 17 ZoneInfoFile 오류 방지 - Eclipse Adoptium 우선 사용
# (Microsoft OpenJDK 17에서 타임존 오류가 발생함)
ADOPTIUM_JDK=""
# Git Bash 경로 (여러 형식 시도)
for candidate in "/c/Program Files/Eclipse Adoptium/jdk-17.0.17.10-hotspot" \
                 "C:/Program Files/Eclipse Adoptium/jdk-17.0.17.10-hotspot" \
                 "/c/Program Files/Eclipse Adoptium/jdk-17"* \
                 "C:/Program Files/Eclipse Adoptium/jdk-17"*; do
    if [ -f "$candidate/bin/java.exe" ] 2>/dev/null; then
        ADOPTIUM_JDK="$candidate"
        break
    fi
done
if [ -n "$ADOPTIUM_JDK" ]; then
    export JAVA_HOME="$ADOPTIUM_JDK"
    export PATH="$ADOPTIUM_JDK/bin:$PATH"
    echo "[자동] Eclipse Adoptium Java 사용: $JAVA_HOME"
else
    # Eclipse Adoptium 없으면 cmd로 mvn.cmd 실행 (Windows Java 사용)
    echo "[참고] Eclipse Adoptium 미발견. cmd로 실행 시도..."
fi

# Java 11이 없으면 TZ 설정으로 Java 17 시도
export TZ=UTC

# Java 17 + Tomcat 7 호환용 JVM 옵션 (MAVEN_OPTS는 Maven 실행 시 적용됨)
export MAVEN_OPTS="--add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED"

# Java 확인
echo "[1/3] Java 설치 확인 중..."
if ! java -version 2>/dev/null; then
    echo "[오류] Java가 설치되어 있지 않습니다!"
    echo ""
    echo "Java 11 설치를 권장합니다 (Java 17에서 오류 발생 시):"
    echo "  winget install EclipseAdoptium.Temurin.11.JDK"
    echo "  또는 https://adoptium.net/ 에서 Java 11 다운로드"
    exit 1
fi
echo "[확인] Java 설치됨"

# 프로젝트 디렉토리로 이동
echo ""
echo "[2/3] 프로젝트 디렉토리 확인 중..."
cd "$(dirname "$0")"
echo "[확인] 작업 디렉토리: $(pwd)"

# Maven 경로 확인
if [ ! -f "apache-maven-3.8.6/bin/mvn" ]; then
    echo "[오류] Maven을 찾을 수 없습니다. maven.zip을 압축 해제하세요."
    echo "  unzip maven.zip"
    exit 1
fi
echo "[확인] Maven 확인됨"

# Java 17 + ZoneInfoFile 오류 가능 시 안내
JAVA_VER=$(java -version 2>&1 | head -1)
if [[ "$JAVA_VER" == *"17"* ]] && [[ "$JAVA_VER" == *"Microsoft"* ]]; then
    echo ""
    echo "[참고] Microsoft OpenJDK 17 사용 중. ZoneInfoFile 오류 발생 시:"
    echo "  winget install EclipseAdoptium.Temurin.11.JDK"
    echo "  설치 후 Git Bash 새로 열고 ./run.sh 다시 실행"
    echo ""
fi

# 빌드 및 실행
echo ""
echo "[3/3] 프로젝트 빌드 및 실행 중..."
echo "서버가 시작되면 브라우저에서 http://localhost:8080/ 접속하세요."
echo "서버를 중지하려면 Ctrl+C를 누르세요."
echo ""

# Eclipse Adoptium 없을 때 cmd로 실행 (Git Bash에서 경로 인식 문제 우회)
if [ -z "$ADOPTIUM_JDK" ]; then
    if [ -d "/c/Program Files/Eclipse Adoptium" ]; then
        WIN_PROJ=$(pwd | sed 's|^/c/|C:\\|;s|^/C/|C:\\|;s|/|\\|g')
        cmd //c "set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot && set PATH=%JAVA_HOME%\bin;%PATH% && set MAVEN_OPTS=--add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED && cd /d $WIN_PROJ && apache-maven-3.8.6\bin\mvn.cmd compile tomcat7:run"
        exit $?
    fi
fi

./apache-maven-3.8.6/bin/mvn compile tomcat7:run
