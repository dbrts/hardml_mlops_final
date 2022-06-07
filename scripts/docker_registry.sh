docker run -d -p 5000:5000 --restart=always --name registry registry:2

docker tag gateway 95.217.236.128:5000/gateway
docker push 95.217.236.128:5000/gateway

docker tag index_service 95.217.236.128:5000/index_service
docker push 95.217.236.128:5000/index_service
