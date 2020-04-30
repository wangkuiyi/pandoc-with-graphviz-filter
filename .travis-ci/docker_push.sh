#!/bin/sh

echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin
docker tag pandoc cxwangyi/pandoc
docker push cxwangyi/pandoc
