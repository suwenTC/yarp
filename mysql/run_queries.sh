#!/bin/bash

start=$(date +%s)
start_date=$(date)
i=1
while [ $i -le 100 ]
      do
	  bash $PWD/run_query.sh "SELECT * from orderdetails AS od LEFT JOIN orders AS o ON od.orderNumber = o.orderNumber WHERE od.quantityOrdered > 0 ORDER BY od.quantityOrdered DESC;"

	  bash $PWD/run_query.sh "SELECT * from orderdetails AS od LEFT JOIN orders AS o ON od.orderNumber = o.orderNumber UNION SELECT * from orderdetails AS od Right JOIN orders AS o ON od.orderNumber = o.orderNumber WHERE od.quantityOrdered > 0;"

	  bash $PWD/run_query.sh "SELECT * from orderdetails AS od CROSS JOIN orders AS o ON od.orderNumber = o.orderNumber WHERE od.quantityOrdered > 0 ORDER BY od.quantityOrdered DESC;"

	  bash $PWD/run_query.sh "SELECT * from orderdetails AS od LEFT JOIN products AS p ON od.productCode = p.productCode WHERE od.quantityOrdered > 0 ORDER BY od.quantityOrdered DESC"

	  bash $PWD/run_query.sh "SELECT * from orderdetails AS od LEFT JOIN products AS p ON od.productCode = p.productCode UNION SELECT * from orderdetails AS od RIGHT JOIN products AS p ON od.productCode = p.productCode WHERE od.quantityOrdered > 0;"
	  
	  bash $PWD/run_query.sh "SELECT * from orderdetails AS od CROSS JOIN products AS p ON od.productCode = p.productCode WHERE od.quantityOrdered > 0 ORDER BY od.quantityOrdered DESC"

	  bash $PWD/run_query.sh "SELECT * from orderdetails AS od1 CROSS JOIN orderdetails AS od2 ON od1.productCode = od2.productCode WHERE od1.quantityOrdered > 0 ORDER BY od1.quantityOrdered DESC"

	  i=$(( $i + 1 ))
done

end=$(date +%s)
end_date=$(date)
touch "/root/time_cost/time_$1.txt"
time_cost=$(( end - start ))
echo "$start_date, $end_date, $time_cost" > "/root/time_cost/time_$1.txt"
