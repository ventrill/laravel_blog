FROM postgres:10.5

ENV POSTGRES_USER mango
ENV POSTGRES_PASSWORD mango
ENV POSTGRES_DB mango_erp_al

ENV TERM=xterm

RUN apt-get update
RUN apt-get install -y vim

ADD postgresql.conf /tmp/postgresql.conf
ADD postgres.sh /docker-entrypoint-initdb.d/
# ADD erp.sql /docker-entrypoint-initdb.d/

