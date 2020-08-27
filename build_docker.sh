cd ansible-server

docker stop ansible-test
docker rm ansible-test
docker rmi ansible-server:latest

# Cleanup any kubernetes
kubectl delete pod/ansible-server

docker build --rm -f Dockerfile -t ansible-server:latest .

# Setup build on docker hub, dont have to push the image to docker hub
# docker tag ansible-server:latest ravann/ansible-server:latest
# docker push ravann/ansible-server:latest

cd ..
