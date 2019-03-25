git clone https://github.com/exodus4d/pathfinder.git
docker run --rm --interactive ($PWD)

docker build --rm -t pathfinder_test .
docker images -q --filter label=stage=intermediate | ForEach-Object {docker rmi -f $_}