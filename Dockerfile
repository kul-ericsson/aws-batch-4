FROM centos:8

# Installing Runtimes and other softwares
RUN yum install -y java wget
RUN adduser tomcat -d /opt/app

# Setting up User and Working Directory
USER tomcat
WORKDIR /opt/app

# Downloading & untar tomcat
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.61/bin/apache-tomcat-8.5.61.tar.gz && tar -xvf apache-tomcat-8.5.61.tar.gz && rm -rf apache-tomcat-8.5.61.tar.gz

# Setting up Startup Script for Tomcat
RUN echo "cd apache-tomcat-8.5.61/bin/" > start-tomcat.sh && echo "./catalina.sh start" >> start-tomcat.sh && echo "tail -f ../logs/catalina.out" >> start-tomcat.sh
COPY target/my-webapp.war apache-tomcat-8.5.61/webapps/thinknyx.war

CMD ["sh","start-tomcat.sh"]