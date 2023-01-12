FROM maven:3.8.4-openjdk-17 AS build
COPY ./ /app
WORKDIR /app
RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:17
RUN mkdir /app
WORKDIR /app
COPY --from=build ./app/api/target/springboot_admin-0.0.1-SNAPSHOT.jar /app
EXPOSE 7000
CMD ["java", "-jar", "springboot_admin-0.0.1-SNAPSHOT.jar"]