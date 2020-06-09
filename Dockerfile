FROM node:13

ARG CHROME_VERSION=69.0.3497.92

USER root

RUN apt update

RUN apt install -y xdg-utils libxss1 libnss3 libnspr4 libasound2
RUN apt install -y libappindicator3-1 fonts-liberation
RUN apt install -y lsb-release
RUN apt install -y wget curl

RUN wget -O chrome.deb https://www.slimjet.com/chrome/download-chrome.php?file=files%2F${CHROME_VERSION}%2Fgoogle-chrome-stable_current_amd64.deb
RUN dpkg -i chrome.deb
