FROM node:13

USER root

RUN apt update

RUN apt install -y xdg-utils libxss1 libnss3 libnspr4 libasound2
RUN apt-get install -y libappindicator3-1 fonts-liberation

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
