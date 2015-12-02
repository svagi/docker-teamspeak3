FROM debian:jessie
MAINTAINER Jan Svager <jan@svager.cz>

# install wget
RUN apt-get update \
  && apt-get install -y wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# setup teamspeak environment variables
ENV TS3_VERSION 3.0.11.4
ENV TS3_URL http://dl.4players.de/ts/releases/$TS3_VERSION/teamspeak3-server_linux-amd64-$TS3_VERSION.tar.gz
ENV TS3_DIR /opt/ts3server

# download and untar teamspeak
RUN mkdir -p $TS3_DIR
WORKDIR $TS3_DIR
RUN wget $TS3_URL -O- | tar -xz --strip-components=1

# copy everything from init folder to WORKDIR
COPY init .

# set WORKDIR as VOLUME to persist data
VOLUME $TS3_DIR

# start teamspeak server
ENTRYPOINT ./ts3server_minimal_runscript.sh
