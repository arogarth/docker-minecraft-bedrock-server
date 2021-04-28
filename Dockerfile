FROM ubuntu:focal

ARG SERVER_VERSION="1.16.221.01"

ENV SERVER_VERSION=$SERVER_VERSION
ENV ACCEPT_EULA "no"
ENV WORKDIR "/opt/minecraft/"

WORKDIR ${WORKDIR}


RUN apt-get update \
 && apt-get install -y curl zip unzip python3 vim

RUN mkdir -p ${WORKDIR} \
 && curl -ksL -o /tmp/server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-${SERVER_VERSION}.zip \
 && unzip /tmp/server.zip -d ${WORKDIR}

RUN chmod +x /opt/minecraft/bedrock_server

COPY entrypoint.sh /
COPY build_properties.py /

EXPOSE 19132

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nogui"]
