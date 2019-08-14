#!/bin/bash

start=$(date +%s)
start_date=$(date)

i=0
while [ $i -lt $(( $1 - 1 )) ]
do
    bash /root/run_queries.sh $i > /dev/null 2>&1 &
    i=$(( $i + 1 ))
done
i=$(( $i + 1 ))
bash /root/run_queries.sh $i > /dev/null 2>&1

end=$(date +%s)
end_date=$(date)
time_cost=$(( end - start ))
touch /root/time_cost/xin1_overall.txt
echo "$start_date, $end_date, $time_cost" > /root/time_cost/xin1_overall.txt
