for host in root@95.217.236.128 root@95.217.239.216; do
    echo $host
    rsync -ravzP dgs $host:/storage/
done
