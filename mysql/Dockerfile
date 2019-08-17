FROM mysql:latest
USER root

RUN apt-get update
RUN chown -R mysql:mysql /var/lib/mysql
RUN mkdir /root/time_cost
RUN mkdir /root/sql
COPY run_query.sh /root
COPY run_queries.sh /root
COPY run_xin1.sh /root
#COPY all-databases.sql /root
COPY run_queries1.sh /root
RUN chmod +x /root/run_queries.sh
RUN chmod +x /root/run_xin1.sh
RUN chmod +x /root/run_queries1.sh
#COPY all-databases.sql /docker-entrypoint-initdb.d/
WORKDIR /root