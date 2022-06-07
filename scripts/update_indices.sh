for host in root@95.217.236.128 root@95.217.239.216; do
    # перемещение старых индексов в архив
    rsync -a --progress --remove-source-files $host:/opt/indices/clust_$3 $host:/storage/dg_$1
    # перемещение новых индексов в прод
    rsync -a --progress --remove-source-files $host:/storage/dg_$2/clust_$3 $host:/opt/indices/
    # обновления центроидов в проде для конкретного кластера
    ssh $host "python /opt/project/scripts/update_centroids.py --new_dg $2 --cluster_id $3 "
done

# rolling update сервиса кластера
ssh kc_2 "docker service update --force --update-parallelism 1 --update-delay 30s pairsstack_index_service_$3"

# rolling update сервиса маршрутизатора
ssh kc_2 "docker service update --force --update-parallelism 1 --update-delay 30s pairsstack_gateway"
