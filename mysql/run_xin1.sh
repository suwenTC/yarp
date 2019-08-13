#!/bin/bash

start=$(date +%s)
start_date=date

i=0
while [ $(( $i - 1 )) -lt $1 ]
do
    bash /root/run_queries.sh $i &
done
bash /root/run_quries.sh $i
end=$(date +%s)
end_date=date
time_cost=$(( end - start ))
touch /root/time_cost/xin1_overall.txt
echo "$start_date, $end_date, $time_cost" > /root/time_cost/xin1_overall.txt
