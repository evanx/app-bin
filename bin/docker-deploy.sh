set -u -e -x
name=`basename $PWD`
git pull
docker build -t $name .
docker rm -f /$name || echo 'not removed'
docker run --name $name -d \
  --network=host \
  --restart unless-stopped \
  -e NODE_ENV=$NODE_ENV \
  $name
