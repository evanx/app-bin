
set -u -e 

  [ $# -eq 1 ]
  name="$1"

  docker ps -a -q -f "name=/${name}" | xargs -r -n 1 docker rm -f 
  docker run --network=host -d \
    --name ${name} \
    -e NODE_ENV=$NODE_ENV \
    ${name}
