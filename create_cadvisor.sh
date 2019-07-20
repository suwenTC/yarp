/opt/go/src/github.com/docker/swarmkit/bin/swarmctl service create \
    --name cadvisor \
    --image google/cadvisor:v0.30.2 \
    --bind /:/rootfs\
    --bind /var/run:/var/run\
    --bind /var/lib/docker/:/var/lib/docker \
    --mode global \
    --restart-condition failure \
    --cpu-limit 0.2 \
    --memory-limit 200m \
    --update-parallelism 1 \
    --update-delay 5s \
    --update-order start-first \
    --ports cadvisor:8080:8080
