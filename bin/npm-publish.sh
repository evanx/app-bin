
set -u -e 

message="${1}"

  version=`npm version | head -1 |
     sed "s/.*'\([0-9].*\)',/\1/"`
  publishedVersion=`npm info | grep latest | 
     sed "s/.*'\([0-9].*\)'.*/\1/"`

set -x

  [ "$version" != "$publishedVersion" ]

  git add -A
  git commit -m "$message" || echo 'commit failed'
  git push

  npm publish
