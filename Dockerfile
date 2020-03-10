FROM ubuntu:bionic

ENV INSTALL_KEY=379CE192D401AB61
ENV DEB_DISTRO=bionic

RUN apt update && apt-get install gnupg1 apt-transport-https dirmngr -y
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
RUN echo "deb https://ookla.bintray.com/debian ${DEB_DISTRO} main" | tee  /etc/apt/sources.list.d/speedtest.list
RUN apt-get update && apt-get install speedtest

CMD ["speedtest", "-p", "no", "-f", "json-pretty", "--accept-license", "--accept-gdpr"]
