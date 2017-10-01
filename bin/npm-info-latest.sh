
if [ -f package.json ]
then
  grep version package.json
  npm info | grep latest
  git status | head -2
fi

