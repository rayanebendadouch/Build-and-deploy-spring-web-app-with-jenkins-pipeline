FROM eclipse-temurin:17-jdk-alpine

ENV APP_HOME usr/src/app

EXPOSE 8082

WORKDIR $APP_HOME

COPY target/*.jar $APP_HOME/app.jar

ENTRYPOINT ["java","-jar","app.jar"]