#This is multi-stage docker image for production ready
#This does not requierd any jar or .jar file configues

# Stage 1: Build stage using an official Gradle image with JDK 17
# This stage compiles the project and produces the Spring Boot fat JAR.
FROM gradle:8-jdk17 AS build

# Set the working directory inside the builder container
WORKDIR /home/gradle/project

# Copy Gradle build files first so dependency resolution can be cached by Docker
# --chown ensures files are owned by the gradle user in the image (avoids permission issues)
COPY --chown=gradle:gradle build.gradle settings.gradle gradle.* ./

# Copy the Gradle wrapper so the builder can run the project with the wrapper if needed
COPY --chown=gradle:gradle gradlew ./

# Copy the gradle wrapper directory (if present) which contains wrapper jars and properties
COPY --chown=gradle:gradle gradle/ gradle/

# Copy the application source code into the builder
COPY --chown=gradle:gradle src/ src/

# Run the Gradle build to create the bootJar (fat jar). --no-daemon avoids daemon issues inside containers.
RUN gradle clean bootJar --no-daemon

# Stage 2: Runtime stage using a distroless Java 17 image
# Distroless images are minimal and contain only what is required to run the JVM.
FROM gcr.io/distroless/java17-debian11

# Set working directory for the runtime image
WORKDIR /app

# Copy the JAR produced in the build stage into the runtime image and rename to app.jar
COPY --from=build /home/gradle/project/build/libs/numbergame-0.0.1-SNAPSHOT.jar app.jar

# Informational: expose the port the application listens on (Spring Boot default 8080)
EXPOSE 8080

# Set an environment variable that the JVM will read automatically.
# -XX:MaxRAMPercentage instructs the JVM to use a percentage of available container memory.
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75.0"

# The command to run when the container starts: run the jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
