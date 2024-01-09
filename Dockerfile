FROM maven:3.6.3-openjdk-11 as builder
COPY . /boxfuse1
WORKDIR /boxfuse1
RUN mvn clean package
