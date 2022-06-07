# Обновление индексов на новое поколение
ssh root@95.217.236.128 "cp /root/hardml_mlops_final/dgs/dg_2/ indices/ -r"
ssh root@95.217.239.216 "cp /root/hardml_mlops_final/dgs/dg_2/ indices/ -r"

# rolling update сервиса индекса кластера
ssh root@95.217.236.128 "docker service update --force --update-parallelism 1 --update-delay 30s qa_index_service_0"
ssh root@95.217.236.128 "docker service update --force --update-parallelism 1 --update-delay 30s qa_index_service_1"
ssh root@95.217.236.128 "docker service update --force --update-parallelism 1 --update-delay 30s qa_index_service_2"
ssh root@95.217.236.128 "docker service update --force --update-parallelism 1 --update-delay 30s qa_index_service_3"

# rolling update сервиса gateway
ssh root@95.217.236.128 "docker service update --force --update-parallelism 1 --update-delay 30s qa_gateway"