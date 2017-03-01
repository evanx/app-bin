set -u -e -x
name=`basename $PWD`
timestamp=`stat -c %Z package.json`
git pull
[ $timestamp -ne `stat -c %Z package.json` ] && npm install
docker build -t $name .
docker rm -f /$name || echo 'not removed'
docker run --name $name -d \
  --network=host \
  --restart unless-stopped \
  -e NODE_ENV=$NODE_ENV \
  $name
