# docker build -t lucaspenido/multi-client:latest -t lucaspenido/multi-client:$SHA -f ./client/Dockerfile ./client
# docker build -t lucaspenido/multi-server:latest -t lucaspenido/multi-server:$SHA -f ./server/Dockerfile ./server
# docker build -t lucaspenido/multi-worker:latest -t lucaspenido/multi-worker:$SHA -f ./worker/Dockerfile ./worker
# docker push lucaspenido/multi-client:latest
# docker push lucaspenido/multi-server:latest
# docker push lucaspenido/multi-worker:latest
# docker push lucaspenido/multi-client:$SHA
# docker push lucaspenido/multi-server:$SHA
# docker push lucaspenido/multi-worker:$SHA
# kubectl set image deployments/client-deployment client=lucaspenido/multi-client:$SHA 
# kubectl set image deployments/server-deployment server=lucaspenido/multi-server:$SHA 
# kubectl set image deployments/worker-deployment worker=lucaspenido/multi-worker:$SHA 

docker build -t lucaspenido/multi-client -f ./client/Dockerfile ./client
docker build -t lucaspenido/multi-server -f ./server/Dockerfile ./server
docker build -t lucaspenido/multi-worker -f ./worker/Dockerfile ./worker
docker push lucaspenido/multi-client
docker push lucaspenido/multi-server
docker push lucaspenido/multi-worker

kubectl rollout restart deployments/client-deployment
kubectl rollout restart deployments/server-deployment
kubectl rollout restart deployments/worker-deployment

kubectl apply -f k8s


