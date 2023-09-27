#!/bin/bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]:-${(%):-%x}}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="${THIS_DIR}/.."

pushd ${PROJ_ROOT} >> /dev/null

KATA_VERSION=$(cat VERSION)

docker build \
    -t csegarragonz/kata_workon:${KATA_VERSION} \
    - < ./csg-bin/kata_workon.dockerfile

popd >> /dev/null
