/opt/go/src/github.com/docker/swarmkit/bin/swarmctl service create \
     --name grafana \
     --image grafana/grafana:5.0.0 \
     --bind /grafana-data:/var/lib/grafana \
     --mode global \
     --restart-condition failure \
     --cpu-limit 0.2 \
     --memory-limit 512m \
     --update-parallelism 1 \
     --update-delay 5s \
     --update-order start-first \
     --ports grafana:3000:3000
