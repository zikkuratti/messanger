#!/bin/sh
docker stop $(docker ps -q -f name=i2pdl)
docker system prune -f
docker build  --no-cache --force-rm -t i2pdl .
#docker run --name=i2pd  -td -p 127.0.0.1:7070:7070 -p 4444:4444 -p 127.0.0.1:4447:4447 -p 9439:9439 -p 7656:7656 -p 5269:5269 -p 5222:5222 i2pd
#docker exec  -it $(docker ps -q -f name=i2pd)  bash
