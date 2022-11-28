FROM mysql:8.0

# RUN apt-get update
# RUN apt-get install -y locales
# RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
#     locale-gen
# ENV LC_ALL en_US.UTF-8 
# ENV LANG en_US.UTF-8  
# ENV LANGUAGE en_US:en

ARG ROOT_PASSWORD=1234
ENV MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD}

ARG SETUP_DATABASE=db_clientes
ENV MYSQL_DATABASE=${SETUP_DATABASE}

ARG SETUP_REMOTE_USERNAME=remote
ARG SETUP_REMOVE_PASSWORD=1234

COPY ./db/script.sql /docker-entrypoint-initdb.d/script.sql

# RUN apt-get -y install locales

RUN echo "CREATE USER '${SETUP_REMOTE_USERNAME}'@'%' IDENTIFIED BY '${SETUP_REMOVE_PASSWORD}';GRANT ALL PRIVILEGES ON *.* TO '${SETUP_REMOTE_USERNAME}'@'%' WITH GRANT OPTION;" > /docker-entrypoint-initdb.d/_grant_remote.sql
EXPOSE 3308
CMD ["mysqld"]