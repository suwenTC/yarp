FROM mysql:latest
USER root

RUN apt-get update
RUN chown -R mysql:mysql /var/lib/mysql
RUN mv run_query.sh /root
RUN mv run_queries.sh /root
COPY all-databases.sql /docker-entrypoint-initdb.d/
