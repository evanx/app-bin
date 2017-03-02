
set -u -e

name=`basename $PWD`

  docker build -t $name .

