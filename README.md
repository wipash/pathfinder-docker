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
```

Edit the routes.ini file to disable the setup path
```
vim pathfinder-config/routes.ini
```



## Cleanup:
```
docker system prune && docker volume prune
```