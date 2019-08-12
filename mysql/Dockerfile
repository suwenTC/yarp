FROM mysql:latest
USER root

RUN apt-get update
RUN chown -R mysql:mysql /var/lib/mysql
RUN mkdir /root/time_cost
COPY run_query.sh /root
COPY run_queries.sh /root
RUN chmod +x /root/run_queries.sh
COPY all-databases.sql /docker-entrypoint-initdb.d/
WORKDIR /root