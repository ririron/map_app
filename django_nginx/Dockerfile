FROM ubuntu:24.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update &&\
	apt upgrade -y &&\
	apt install -y curl &&\
	apt install -y wget &&\
	apt install -y git

RUN apt install -y build-essential libbz2-dev libdb-dev \
	libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
	libncursesw5-dev libsqlite3-dev libssl-dev \
	zlib1g-dev uuid-dev tk-dev

COPY requirements.txt requirements.txt
RUN wget https://www.python.org/ftp/python/3.12.4/Python-3.12.4.tar.xz &&\
	tar xJf Python-3.12.4.tar.xz &&\
	cd Python-3.12.4 &&\
	./configure &&\
	make install &&\
	cd .. &&\
	pip3 install -r requirements.txt
