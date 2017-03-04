set -u -e -x
name=`basename $PWD`
timestamp=`stat -c %Z package.json`
lastCommit() {
  git log | head -1 | cut -f2 -d' '
}
lastCommit=`lastCommit`
git pull
if [ "$lastCommit" = `lastCommit` ]
then
  sleep 2
  git pull
fi
[ $timestamp -ne `stat -c %Z package.json` ] && npm install
docker build -t $name .
docker rm -f /$name || echo 'not removed'
docker run --name $name -d \
  --network=host \
  --restart unless-stopped \
  -e NODE_ENV=$NODE_ENV \
  $name
docker logs -f $name
