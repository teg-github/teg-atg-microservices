#!/bin/sh
source ~/env.properties
SERVER="http://localhost:8081"
URL="$SERVER/nexus/service/local/artifact/maven/content"

REPO="ATG-MicroService-Releases"
USER="admin:admin123"

group=Releases
artifact=ProductionEAR
version=$BUILD_VERSION
ext=zip
filename=ATGProduction.ear.zip

cd /var/jenkins_home/tools/data
curl --write-out "\nStatus: %{http_code}\n" \
    --request POST \
    --user $USER \
    -F "r=$REPO" \
    -F "g=$group" \
    -F "a=$artifact" \
    -F "v=$version" \
    -F "p=$ext" \
    -F "file=@$filename" \
    "$URL"
