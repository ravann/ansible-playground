cd orchestrate

# Delete the stuff created
kubectl delete pod/ansible-server
kubectl delete service/ansible-server-np

# Create ansible-server pod
kubectl apply -f ansible-server-pod.yaml

# Create node port service
kubectl apply -f ansible-server-nodeport.yaml

sleep 10

# Show logs to see the URL
kubectl logs ansible-server

cd .. 
