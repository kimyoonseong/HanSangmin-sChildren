# Stage 1: Build stage
FROM maven:3.8.4-openjdk-17-slim AS build

# Copy Maven files for dependency resolution
COPY pom.xml ./
COPY .mvn .mvn

# Copy application source code
COPY src src

ENV DBurl=jdbc:mysql://food.crmw4qks6exz.ap-northeast-2.rds.amazonaws.com/food?serverTimezone=UTC
ENV DBID=food

# Build the project and create the executable JAR
RUN mvn package

# Stage 2: Run stage
FROM openjdk:17-jdk-slim

WORKDIR /app
COPY --from=build /target/*.war app.war
CMD ["java", "-jar", "app.war"]
