FROM ubuntu:bionic

ARG SERVER_VERSION="1.16.210.06"

ENV SERVER_VERSION="${SERVER_VERSION}" \
    ACCEPT_EULA="no" \
    WORKDIR="/opt/minecraft/"

WORKDIR ${WORKDIR}


RUN apt-get update \
 && apt-get install -y curl zip unzip python3 vim

RUN mkdir -p ${WORKDIR} \
 && curl -sL -o /tmp/server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-${SERVER_VERSION}.zip \
 && unzip /tmp/server.zip -d ${WORKDIR}

VOLUME /opt/minecraft/
COPY entrypoint.sh /
COPY build_properties.py /

EXPOSE 19132

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nogui"]
