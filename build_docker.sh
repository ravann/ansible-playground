cd ansible-server

docker stop ansible-test
docker rm ansible-test
docker rmi ansible-server:latest
docker rmi ravann/ansible-server:latest
docker build --rm -f Dockerfile -t ansible-server:latest .

docker tag ansible-server:latest ravann/ansible-server:latest
docker push ravann/ansible-server:latest

cd ..
