#!/usr/bin/env python

import sys
import re
import os
import time
import docker
import json

def stats(id):
    client = docker.from_env()
    generator = client.stats(id)
    container_stats=eval(generator.next())
    mem_usage = container_stats['memory_stats']['usage']
    mem_limit = container_stats['memory_stats']['limit']
    mem_percent = round(float(mem_usage)/float(mem_limit), 4)*100

    system_use = container_stats['cpu_stats']['system_cpu_usage']
    total_use=container_stats['cpu_stats']['cpu_usage']['total_usage']

    generator = client.stats(id)
    container_stats=eval(generator.next())

    system_use2 = container_stats['cpu_stats']['system_cou_usage']
    total_use2 = container_stats['cpu_stats']['cpu_usage']['total_usage']

    cpu_count=len(container_stats['cpu_stats']['cpu_usage']['percpu_usage'])
    cpu_percent = round((float(total_use2-total_use)/float(system_use2-system_use))*cpu_count*100,.0, 2)

    network_info = container_stats['networks']['eth0']
    network_bytes = network_info['rx_bytes'] + network_info['tx_bytes']
    client.close()
    
    return {
        'cpu_percent':cpu_percent,
        'mem_percent':mem_percent,
        'network':network_bytes,
        'id':id
    }

def get_stats():
    client = docker.from_env()
    c_list = client.containers.list(True)
    info = {}
    cpu = 0
    mem = 0
    for c in c_list:
        try:
            stat = stats(c['Id'])
        except:
            continue

        cpu = cpu + stat['cpu_percent']
        mem = mem + stat['mem_percent']
    client.close()
    return {
        "cpu": cpu,
        "mem": mem
        }

while True:
    infos = []
    for i in range(1, 2):
        info = get_stats()
        infos.append(info)

    cpu = 0
    mem = 0

    for info in infos:
        cpu = cpu + info['cpu']
        mem = mem + info['mem']
    cpu = cpu / len(infos)
    mem = mem / len(infos)

    f = open("/tmp/docker.json", "w")
    s = json.dumps({
        "mem": mem,
        "cpu": cpu
        })

    f.write(s)
    f.close()
