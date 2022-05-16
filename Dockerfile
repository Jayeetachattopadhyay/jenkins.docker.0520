
FROM maven:3.8.5-openjdk-11 AS maven_build

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn package

FROM openjdk

RUN mkdir /usr/local/tomcat/webapps/myapp

COPY tmp/target/kubernetes-1.0.war /usr/local/tomcat/webapps/kubernetes-1.0.war

CMD java -jar /usr/local/tomcat/webapps/kubernetes-1.0.war
