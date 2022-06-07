# Обновление индексов на новое поколение
ssh root@95.217.236.128 "cp dgs/dg_2/ indices/ -r"
ssh root@95.217.239.216 "cp dgs/dg_2/ indices/ -r"

# rolling update сервиса индекса кластера
ssh root@95.217.236.128 "docker service update --force --update-parallelism 1 --update-delay 30s qa_index_service_$3"

# rolling update сервиса gateway
ssh root@95.217.236.128 "docker service update --force --update-parallelism 1 --update-delay 30s qa_gateway"
