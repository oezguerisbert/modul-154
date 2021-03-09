docker run -d --name "modul-154_2" -p 3307:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql
docker exec -it "modul-154_2" /bin/bash -c "$(cat ./migration-docker.sh)"