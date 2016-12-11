FROM debian:wheezy

ENV MOCK_VERSION 1.2.5

RUN apt-get update --yes
RUN apt-get install openjdk-7-jre-headless --yes
RUN apt-get install wget --yes

RUN mkdir -p /opt/uaimockserver
WORKDIR /opt/uaimockserver
RUN wget http://downloads.sourceforge.net/project/uaimockserver/uaiMockServer-$MOCK_VERSION.Standalone.jar

RUN apt-get clean --yes

COPY uaiMockServer.json /opt/uaimockserver/uaiMockServer.json
COPY startup.sh /opt/uaimockserver/startup.sh

EXPOSE 1234

ENTRYPOINT ["/bin/bash", "/opt/uaimockserver/startup.sh"]
