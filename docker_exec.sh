#!/bin/bash

docker_exec () {
  docker exec -it $1 bash
}

docker-compose down
docker-compose up --build -d
CID=$(docker ps | grep -E 'supportengineer|sqlhunt_web' | awk '{print $1}')
if [ -z "$CID" ]; then
  echo "Container not found. Restarting Docker"
  docker-compose down
  docker-compose up -d
else
  echo "Found container: ${CID}"
  echo "Connecting to container..."
  docker_exec $CID
fi


