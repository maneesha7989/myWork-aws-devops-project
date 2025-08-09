set -e

docker pull docker.io/penskeapps/python-flaskapp:v1

docker run -d -p 5000:5000 docker.io/penskeapps/python-flaskapp:v1
