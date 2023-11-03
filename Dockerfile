FROM tomcat:10.1.13-jdk11
RUN apt update
RUN apt install git -y
RUN apt install maven -y
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /tmp/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /usr/local/tomcat/webapps/

#можно убрать, т.к. используется готовый образ томката и там эти инструкции уже есть
EXPOSE 80 
CMD ["catalina.sh", "run"] 
