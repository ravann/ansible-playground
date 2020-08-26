cd ansible-server

docker stop ansible-test
docker rm ansible-test
docker rmi ansible-server:latest
docker rmi ravann/ansible-server:latest
docker build --rm -f Dockerfile -t ansible-server:latest .

# Cleanup any kubernetes
ps -ef | grep kubectl | grep -v grep | cut -f 2 -d " " | xargs kill
kubectl delete pod/ansible-server

docker tag ansible-server:latest ravann/ansible-server:latest
docker push ravann/ansible-server:latest

cd ..
