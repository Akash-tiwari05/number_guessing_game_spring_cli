# -------- Build stage --------
FROM gradle:8-jdk17 AS build

WORKDIR /home/gradle/project

COPY --chown=gradle:gradle gradlew .
COPY --chown=gradle:gradle gradle/ gradle/
COPY --chown=gradle:gradle build.gradle settings.gradle ./
COPY --chown=gradle:gradle src/ src/

RUN chmod +x ./gradlew
RUN ./gradlew --no-daemon bootJar -x test

# -------- Runtime stage --------
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copy the jar (matches *-SNAPSHOT.jar)
COPY --from=build /home/gradle/project/build/libs/*-SNAPSHOT.jar /app/app.jar

EXPOSE 8080
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75.0"

ENTRYPOINT ["java","-jar","/app/app.jar"]
