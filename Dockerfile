FROM ubuntu:bionic

# https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
ENV MAX_MEMORY  "1g"
ENV ACCEPT_EULA "no"
ENV SERVER_DIR "/opt/minecraft/"

WORKDIR ${SERVER_DIR}


RUN apt-get update \
 && apt-get install -y curl openjdk-8-jre

RUN   mkdir -p ${SERVER_DIR} \
 && curl -s -O https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar

VOLUME /opt/minecraft/
COPY entrypoint.sh /


EXPOSE 25565

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nogui"]
