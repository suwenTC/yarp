#!/bin/sh
sudo bash /yarp/setup.sh
sudo rm -rf /var/lib/swarmd/
sudo rm -rf /tmp/node-0/
sudo nohup /opt/go/src/github.com/docker/swarmkit/bin/swarmd -d /tmp/node-0 --listen-control-api /tmp/node-0/swarm.sock --hostname node-0 &
export SWARM_SOCKET=/tmp/node-0/swarm.sock
token=`/opt/go/src/github.com/docker/swarmkit/bin/swarmctl cluster inspect default | grep Worker | cut -c13-`

i=1
cat workers | while read line
do
    if [ "$line" = "-" ]; then
        echo "Skip $line"
    else
	echo "/opt/go/src/github.com/docker/swarmkit/bin/swarmd -d /tmp/node-$i --hostname node-$i --join-addr node-0:4242 --join-token $token" > /yarp/joincommand.sh
        ssh root@$line -n "rm -rf /yarp/ && mkdir /yarp/"
        echo "Copy data to $line"
        scp  /yarp/setup.sh root@$line:/yarp/ && scp /yarp/joincommand.sh root@$line:/yarp/
	scp /swarmkit.tar.gz root@$line:/
        echo "Setup $line"
        ssh root@$line -n "cd /yarp/ && bash setup.sh && bash joincommand.sh"
        echo "Finished config node $line"
        echo "########################################################"
    fi
    i=$(( $i + 1 ))
done
