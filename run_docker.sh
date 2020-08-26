set -x

docker stop ansible-test
docker rm ansible-test

docker run -d -p 8888:8888 \
    -v ${PWD}/ansible:/home/jovyan/ansible \
    --name ansible-test ansible-server:latest
