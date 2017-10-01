
if [ $# -ne 1 ]
then
  exit 1
fi

message="$1"
git add -A
git commit -m "$message"
git push

