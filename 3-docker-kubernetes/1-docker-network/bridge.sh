#!/usr/bin/env sh

docker network create --driver=bridge izero-bridge

docker run -d --network=izero-bridge --net-alias=hello nginx
docker run -d --network=izero-bridge --net-alias=grafana grafana/grafana
