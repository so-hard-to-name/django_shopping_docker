FROM mariadb:10.5

COPY init-db.sql /docker-entrypoint-initdb.d/api_db_init.sql

