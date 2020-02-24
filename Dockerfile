FROM ubuntu:bionic

# https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
ENV MAX_MEMORY  "1g"
ENV ACCEPT_EULA "no"
ENV WORKDIR "/opt/minecraft/"

WORKDIR ${WORKDIR}


RUN apt-get update \
 && apt-get install -y curl openjdk-11-jre-headless zip unzip

RUN mkdir -p ${WORKDIR} \
 && curl -sL -o /tmp/server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.30.2.zip \
 && unzip /tmp/server.zip -d ${WORKDIR}

VOLUME /opt/minecraft/
COPY entrypoint.sh /

EXPOSE 25565

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nogui"]
