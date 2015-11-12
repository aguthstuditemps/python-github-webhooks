FROM ubuntu:14.04

MAINTAINER Andreas Guth  <andreas.guth@studitemps.de>

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /src

RUN apt-get update &&\
    apt-get -y install sed python-pip python-dev uwsgi-plugin-python git

ADD requirements.txt /src/
RUN pip install -r /src/requirements.txt

COPY ssh /root/.ssh
ADD webhooks.py config.json hooks /src/

CMD ["python", "/src/webhooks.py"]
