
set -u -e

name=`
  cat package.json |
  jq '.name' |
  sed 's/"\(.*\)"/\1/'
`
[ -n "$name" ] 

  docker build -t $name .

