
set -u -e 

  name=`basename $PWD`

  docker logs -f $name

