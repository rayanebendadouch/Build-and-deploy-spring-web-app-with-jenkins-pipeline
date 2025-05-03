FROM eclipse-temurin:17-jdk-alpine

WORKDIR usr/src/app

EXPOSE 8082

COPY target/*.jar usr/src/app/app.jar

ENTRYPOINT ["java","-jar","app.jar"]