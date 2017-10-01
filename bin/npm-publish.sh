
set -u -e 

  version=`npm version | head -1 |
     sed "s/.*'\([0-9].*\)',/\1/"`
  publishedVersion=`npm info | grep latest | 
     sed "s/.*'\([0-9].*\)'.*/\1/"`

set -x

  [ "$version" != "$publishedVersion" ]

  if git status | head -2 | tail -1 | grep -qv '^Your branch is up-to-date'
  then
    git add -A
    message="${1}"
    git commit -m "$message" || echo 'commit failed'
  fi
  git push

  npm publish
