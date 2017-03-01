
message='initial'
if [ $# -eq 1 ]
then
  message="$1"
elif [ $# -gt 1 ]
then
  exit 1
fi

  git add -A
  git commit -m 'initial'
  git push

