FROM unserefamilie_base
MAINTAINER Ulrich Goertz "ug@geometry.de"

ENV REFRESHED_AT 2016-12-25

RUN mkdir -p /etc/my_init.d
ADD ./config/app/setup.sh /etc/my_init.d/setup.sh
ADD ./config/app/database-check.py /var/config/database-check.py

