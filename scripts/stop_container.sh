set -e

containerid=$(docker ps -q)

# checking if the command output is not Empty
if [ -n "$containerid" ]; then
  docker stop $containerid && docker rm -f $containerid
else
  echo "no running containers to reomve"
fi
