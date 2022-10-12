FROM tnir/mysqlclient
#FROM python:3.7.4-alpine3.10
#FROM alpine:latest
COPY . .
#RUN apt-get install pip
#RUN apt-get update \
#    && apt-get --yes --no-install-recommends install \
#        python3 python3-dev \
#        python3-pip python3-venv python3-wheel python3-setuptools python-dev \
#       libmysqlclient-dev libssl-dev \
#       #python3.7-dev default-libmysqlclient-dev \
#        #build-essential cmake \
#        #graphviz git openssh-client \
#       #libssl-dev libffi-dev \
#    && rm -rf /var/lib/apt/lists/*
#RUN apt install libmysqlclient-dev
#RUN apt-get update && sudo apt-get upgrade
#RUN apt-get install python-dev
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate
#ADD app.py /
#ADD data.pyc /
#ADD templates/ templates/
WORKDIR /
EXPOSE 8000
CMD ["python","manage.py","runserver"]
