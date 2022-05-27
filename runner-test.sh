#!/bin/bash -l

set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"
echo ">> DIR: ${DIR}"

TEAM=reco
APPNAME=${APPNAME:-log-pipeline-oscar-test}
APPTAG=${APPTAG:-test}
REPO_URL=registry.infra.music-flo.io

DOCKERFILE=$DIR/Dockerfile
IMGNAME="$REPO_URL/$TEAM/$APPNAME:$APPTAG"

docker build \
    --tag "${IMGNAME}" \
    -f "$DOCKERFILE" \
    --force-rm \
    $DIR

docker run -it --rm \
    -p 8380:80 \
    --name $APPNAME \
    $IMGNAME