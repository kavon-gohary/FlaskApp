FROM alpine

RUN apk update
RUN apk add python3
RUN apk add vim
RUN apk add gcc
RUN apk add git
RUN pip3 install --upgrade pip
RUN pip3 install coverage
RUN pip3 install pep8
RUN pip3 install pylint
RUN pip3 install flask
RUN pip3 install flask-bootstrap

WORKDIR /home

RUN git init
RUN git clone https://github.com/kavon-gohary/FlaskApp.git

