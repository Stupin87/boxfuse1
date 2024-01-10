FROM openjdk:11-jre-slim
WORKDIR /boxfuse1
COPY --from=builder /boxfuse1/target/hello-1.0.war /boxfuse1/hello-1.0.war
CMD ["java", "-jar", "hello-1.0.war"]

