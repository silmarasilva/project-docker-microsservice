# syntax=docker/dockerfile:1
FROM python:latest
LABEL Key="Silmara Silva"


# RUN apt-get update
# RUN apt-get install -y locales
# RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
#     locale-gen
# ENV LC_ALL en_US.UTF-8 
# ENV LANG en_US.UTF-8  
# ENV LANGUAGE en_US:en

WORKDIR /app
COPY ./app /app
RUN pip3 --no-cache-dir install -r requirements.txt
#EXPOSE 5100
ENTRYPOINT [ "python3" ]
CMD [ "main_cursos.py" ]