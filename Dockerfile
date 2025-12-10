FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY build/libs/numbergame-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75.0"
ENTRYPOINT ["java","-jar","/app/app.jar"]
