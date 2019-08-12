FROM mysql:latest
USER root

RUN apt-get update
RUN chown -R mysql:mysql /var/lib/mysql
RUN mkdir /root/time_cost
COPY run_query.sh /root
COPY run_queries.sh /root
COPY run_5in1.sh /root
RUN chmod +x /root/run_queries.sh
RUN chmod +x /root/run_5in1.sh
COPY all-databases.sql /docker-entrypoint-initdb.d/
WORKDIR /root