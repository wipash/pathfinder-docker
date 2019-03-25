docker build --rm -t pathfinder_test .
docker images -q --filter label=stage=intermediate | ForEach-Object {docker rmi -f $_}