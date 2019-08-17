#!/bin/bash

start=$(date +%s)
start_date=$(date)

mysql -uroot -p1234 < /root/sql/imdb.sql
echo "done loading"

i=0
while [ $i -lt 3 ]
do
    bash $PWD/run_query.sh "SELECT * from title AS t LEFT JOIN title_basics AS tb ON t.titleId = tb.tconst WHERE tb.isAdult = 0 ORDER BY tb.tconst DESC;" > /dev/null 2>&1
    
    bash $PWD/run_query.sh "SELECT * from title AS t RIGHT JOIN title_basics AS tb ON t.titleId = tb.tconst WHERE t.isOriginalTitle = 0 ORDER BY t.titleId DESC;" > /dev/null 2>&1

    bash $PWD/run_query.sh "SELECT * from title_basics AS tb RIGHT JOIN title_episode AS te ON tb.tconst = te.tconst WHERE tb.isAdult = 0 ORDER BY tb.tconst ASC;" > /dev/null 2>&1

    sleep 1
    echo $i
done

end=$(date +%s)
end_date=$(date)
touch "/root/time_cost/time_$1.txt"
time_cost=$(( end - start ))
echo "$start_date, $end_date, $time_cost" > "/root/time_cost/time_$1.txt"
