FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt install python3.8 -y
RUN apt install vim -y
RUN apt install net-tools -y
RUN apt install iputils-ping -y
RUN apt install python3-pip -y

RUN apt update -y
RUN apt-get install -y openjdk-8-jdk

RUN apt update -y 
RUN apt install language-pack-ko -y
RUN apt install fonts-nanum -y
RUN apt install fonts-nanum-coding -y
RUN apt install fonts-noto-cjk -y
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

WORKDIR /root
RUN echo 'alias python=python3.8' >> .bashrc

WORKDIR /

EXPOSE 8080


RUN mkdir /app
COPY . /app
WORKDIR /app

RUN chown -R 1000:1000 /app

RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3", "server.py"]