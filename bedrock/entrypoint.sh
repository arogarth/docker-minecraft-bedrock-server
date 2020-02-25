#!/bin/bash
set -x
if [ "${ACCEPT_EULA}" == "true" ]; then
  echo "eula=true" > eula.txt
fi

python3 /build_properties.py

cat ${WORKDIR}/server.properties
LD_LIBRARY_PATH=$WORKDIR $WORKDIR/bedrock_server
