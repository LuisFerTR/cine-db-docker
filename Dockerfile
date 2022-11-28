FROM mysql

ENV MYSQL_ROOT_PASSWORD=prog-Nube-2022&
ENV MYSQL_DATABASE=rest_api
ENV MYSQL_USER=rest_admin
ENV MYSQL_PASSWORD=&rest_api15 


COPY schema.sql /docker-entrypoint-initdb.d

EXPOSE 3306