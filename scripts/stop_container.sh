set -e

containerid=$(docker ps -q)

# checking if the command output is not Empty
if [ -n "$containerid" ]; then
  docker stop $containerid && docker rm -f $containerid
  echo "container stopped and removed"
else
  echo "no running containers to reomve"
fi
