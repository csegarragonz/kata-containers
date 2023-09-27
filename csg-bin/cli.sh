#!/bin/bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]:-${(%):-%x}}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="${THIS_DIR}/.."

pushd ${PROJ_ROOT} >> /dev/null

KATA_VERSION=$(cat VERSION)
KATA_WORKON_CTR_NAME=kata-workon
KATA_CODE_DIR=/go/src/github.com/kata-containers/kata-containers

# Start the container in detached mode
[[ "$( docker container inspect -f '{{.State.Running}}' ${KATA_WORKON_CTR_NAME} )" = "true" ]] || \
    docker run -d -t \
        --name ${KATA_WORKON_CTR_NAME} \
        -v ${PROJ_ROOT}:${KATA_CODE_DIR} \
        csegarragonz/kata_workon:${KATA_VERSION}

docker exec -it ${KATA_WORKON_CTR_NAME} bash
