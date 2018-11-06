
docker pause master
docker unpause rediscluster_master_1


docker exec rediscluster_sentinel_1 redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster

docker-compose scale sentinel=3


[1]: https://github.com/mdevilliers/docker-rediscluster
[2]: https://registry.hub.docker.com/u/joshula/redis-sentinel/
[3]: https://docs.docker.com/compose/
[4]: https://www.docker.com

