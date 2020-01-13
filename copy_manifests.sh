id=$(docker create $1)
docker cp $id:/manifests $PWD
docker rm -v $id