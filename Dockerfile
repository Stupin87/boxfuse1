FROM maven:3.6.3-openjdk-11 as builder
FROM docker:latest
COPY --from=builder /usr/local/bin/docker /usr/local/bin/docker
COPY . /boxfuse1
WORKDIR /boxfuse1
RUN mvn clean package
