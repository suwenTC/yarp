FROM mysql:latest
USER root

RUN apt-get update
RUN chown -R mysql:mysql /var/lib/mysql
COPY all-databases.sql /docker-entrypoint-initdb.d/