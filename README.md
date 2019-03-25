Build container:

docker build --rm -t pathfinder_test .

docker rmi $(docker images --filter dangling=true -q --no-trunc)
docker system prune