
set -u -e

name=`
  cat package.json |
  jq '.name' |
  sed 's/"\(.*\)"/\1/'
`
[ -n "$name" ] 
repo=`
  cat package.json | 
  jq '.repository.url' | 
  sed 's/"\(.*\)"/\1/'
`
[ -n "$repo" ] 
user=`
  docker info 2>/dev/null |
  grep ^Username |
  sed 's/^Username: \(.*\)$/\1/'
`
[ -n "$user" ] 

  docker build -t $name $repo
  docker tag $name $user/$name
  docker push $user/$name

