FROM python:3

ENV TZ=America/Recife
ENV LANG C.UTF-8

WORKDIR /docker-im

RUN apt-get update && apt-get install -y python3-dev python3-pip git

RUN pip install --no-cache-dir --upgrade pip setuptools

RUN python3 --version
