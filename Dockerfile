FROM debian:wheezy

ENV MOCK_VERSION 1.2.5

RUN apt-get update --yes
RUN apt-get install openjdk-7-jre-headless --yes
RUN apt-get install wget --yes

RUN mkdir -p /opt/uaimockserver
WORKDIR /opt/uaimockserver
RUN wget https://github.com/uaihebert/uaiMockServer/raw/master/dist/01_02_05/uaiMockServer-1.2.5.Standalone.jar

RUN apt-get clean --yes

COPY uaiMockServer.json /opt/uaimockserver/uaiMockServer.json
COPY startup.sh /opt/uaimockserver/startup.sh

EXPOSE 1234

ENTRYPOINT ["/bin/bash", "/opt/uaimockserver/startup.sh"]
