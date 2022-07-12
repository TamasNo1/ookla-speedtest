FROM ubuntu:focal

ENV DEB_DISTRO=focal
ENV GPG_KEY_URL=https://packagecloud.io/ookla/speedtest-cli/gpgkey
ENV GPG_KEY_ID=8E61C2AB9A6D1557

RUN apt update && apt install gnupg1 apt-transport-https dirmngr curl -y
RUN echo "deb https://packagecloud.io/ookla/speedtest-cli/ubuntu/ ${DEB_DISTRO} main\ndeb-src https://packagecloud.io/ookla/speedtest-cli/ubuntu/ ${DEB_DISTRO} main" | tee  /etc/apt/sources.list.d/speedtest.list
RUN curl -L "${GPG_KEY_URL}" 2> /dev/null | apt-key add - &>/dev/null && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ${GPG_KEY_ID} && apt update && apt install speedtest -y

CMD ["speedtest", "-p", "no", "-f", "json-pretty", "--accept-license", "--accept-gdpr"]
