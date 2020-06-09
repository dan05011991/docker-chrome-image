FROM openjdk:8-jdk

ARG CHROME_VERSION=69.0.3497.92

USER root

RUN apt update

RUN apt install -y xdg-utils libxss1 libnss3 libnspr4 libasound2
RUN apt install -y libappindicator3-1 fonts-liberation
RUN apt install -y lsb-release
RUN apt install -y wget curl

RUN wget -O chrome.deb https://www.slimjet.com/chrome/download-chrome.php?file=files%2F${CHROME_VERSION}%2Fgoogle-chrome-stable_current_amd64.deb
RUN dpkg -i chrome.deb

RUN wget -O /opt/node-v12.18.0-linux-x64.tar.xz https://nodejs.org/dist/v12.18.0/node-v12.18.0-linux-x64.tar.xz \
    && tar -C /opt -xvf /opt/node-v12.18.0-linux-x64.tar.xz \
    && rm /opt/node-v12.18.0-linux-x64.tar.xz

RUN wget -O /opt/apache-maven-3.5.2-bin.tar.gz https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz \
    && tar -C /opt -xvf /opt/apache-maven-3.5.2-bin.tar.gz \ 
    && rm /opt/apache-maven-3.5.2-bin.tar.gz

ENV PATH="/opt/node-v12.18.0-linux-x64/bin:/opt/apache-maven-3.5.2/bin:${PATH}"
