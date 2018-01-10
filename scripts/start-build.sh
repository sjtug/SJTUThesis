#!/usr/bin/env bash

set -e               # exit on error

cd "$(dirname "$0")" # connect to root

if [ "$(uname -s)" == "Linux" ]; then
  USER_NAME=${SUDO_USER:=$USER}
  USER_ID=$(id -u "${USER_NAME}")
  GROUP_ID=$(id -g "${USER_NAME}")
else # boot2docker uid and gid
  USER_NAME=$USER
  USER_ID=1000
  GROUP_ID=50
fi

docker build -t "sjtuthesis-${USER_ID}" - <<UserSpecificDocker
FROM quay.io/sjtug/sjtuthesis:latest
RUN groupadd --non-unique -g ${GROUP_ID} ${USER_NAME}
RUN useradd -g ${GROUP_ID} -u ${USER_ID} -k /root -m ${USER_NAME}
UserSpecificDocker

docker run --rm=true \
  -v "${PWD}:/workdir" \
  -w "/workdir" \
  -u "${USER_NAME}" \
  "sjtuthesis-${USER_ID}"
