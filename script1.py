import os
import random
import threading
from time import ctime,sleep
import time

tm = t = str(int(time.time()))
cc = 200
array = []
for i in range(0, cc):
    array.append(i)


def doit(index):
    print "sleep " + str(array[i]) + " s"
    sleep(array[i])
    global tm
    print "start thread " + str(index)
    
    os.system("export SWARM_SOCKET=/tmp/node-0/swarm.sock && swarmctl service create --replicas 2 --name task-" + str(index) + " --env MEMORY=100 --env file=" + tm + " --env service_id=service" + str(index) + " --image myidwei/test:0.02")
for i in range(0, cc):
    #doit(i)
    t = threading.Thread(target=doit,args=(i,))
    t.start()
