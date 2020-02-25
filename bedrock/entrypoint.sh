#!/bin/bash
set -x
if [ "${ACCEPT_EULA}" == "true" ]; then
  echo "eula=true" > eula.txt
fi
#java -Xms1G -Xmx${MAX_MEMORY} -jar server.jar nogui
LD_LIBRARY_PATH=$WORKDIR $WORKDIR/bedrock_server
