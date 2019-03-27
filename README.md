## Setup:
Clone the repo:
```
git clone https://github.com/wipash/pathfinder-docker.git
cd pathfinder-docker
```

Create config files:
```
for f in pathfinder-config/*.dist; do mv -- "$f" "${f%.dist}"; done
```

Edit config files with relevant EVE API info:
```
vim pathfinder-config/environment.ini
vim pathfinder-config/pathfinder.ini
```

Start the system
```
docker-compose up -d
```

Set up the DB
```
http://yourpathfinderserver.com/setup
docker exec -i pathfinder-docker_mariadb-eve_1 mysql -umariadb-eve -pmariadb-eve mariadb-eve < eve_universe.sql
```

Edit the routes.ini file to disable the setup path
```
vim pathfinder-config/routes.ini
```



## Cleanup:
```
docker system prune && docker volume prune
```