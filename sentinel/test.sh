#!/usr/bin/env bash
MASTER_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' redis-cluster_master_1)
SLAVE_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' redis-cluster_slave_1)
SENTINEL_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' redis-cluster_sentinel_1)
docker exec redis-cluster_sentinel_1 redis-cli -p 26379 info Sentinel
docker exec redis-cluster_sentinel_1 redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster

docker pause redis-cluster_master_1
sleep 10
docker exec redis-cluster_sentinel_1 redis-cli -p 26379 info Sentinel
docker exec redis-cluster_sentinel_1 redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster
docker unpause redis-cluster_master_1
sleep 5
docker exec redis-cluster_sentinel_1 redis-cli -p 26379 info Sentinel
docker exec redis-cluster_sentinel_1 redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster
