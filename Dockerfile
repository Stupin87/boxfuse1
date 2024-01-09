FROM maven:3.6.3-jdk-11 AS builder
WORKDIR /boxfuse1
COPY pom.xml .
COPY src/ /boxfuse1/src/
RUN mvn -B -DskipTests clean package

FROM openjdk:11
WORKDIR /boxfuse1
COPY --from=builder /boxfuse1/target/hello-1.0.war /boxfuse1/hello-1.0.war
CMD ["java", "-jar", "hello-1.0.war"]
