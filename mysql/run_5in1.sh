#!/bin/bash

start=$(date +%s)
bash /root/run_queries.sh 1 &
bash /root/run_queries.sh 2 &
bash /root/run_queries.sh 3 &
bash /root/run_queries.sh 4 &
bash /root/run_queries.sh 5
end=$(date +%s)
time_cost=$(( end - start ))
touch /root/time_cost/5in1_overall.txt
echo $time_cost > /root/time_cost/5in1_overall.txt
