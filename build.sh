#pathfinder_dir="$(pwd)/pathfinder"
#mkdir -p $pathfinder_dir
#docker run -ti --rm -e USERID=$UID -v ${HOME}:/root -v $pathfinder_dir:/git alpine/git clone https://github.com/exodus4d/pathfinder.git .
#docker run --rm -v $pathfinder_dir:/app composer install --ignore-platform-reqs

docker build --rm -t pathfinder_test .
docker rmi -f $(docker images -q --filter label=stage=intermediate)
