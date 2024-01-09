FROM maven:3.6.3-jdk-11 AS builder
WORKDIR /boxfuse1
COPY pom.xml .
COPY src/ /boxfuse1/src/
RUN mvn -B -DskipTests clean package

FROM openjdk:11
WORKDIR /boxfuse1
COPY --from=builder /boxfuse1/target/*.jar /boxfuse1/app.jar
RUN docker push 158.160.47.233:8081/boxfuse1:${BUILD_NUMBER}
