FROM phusion/baseimage:noble-1.0.2
MAINTAINER Ulrich Goertz "ug@geometry.de"

ENV REFRESHED_AT 2025-05-09

RUN apt-get update
RUN apt-get install -y sudo build-essential git gettext
RUN apt-get install -y python3 python3-dev python3-setuptools python3-pip
RUN apt-get install -y libffi-dev libssl-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y libpcre3 libpcre3-dev
RUN apt-get install -y libjpeg-dev libtiff5-dev zlib1g-dev libopenjp2-7-dev
RUN apt-get install -y libcairo2 pandoc
RUN apt-get install -y binutils libproj-dev gdal-bin

# add pandoc from separate deb file if required; for now the Ubuntu version is
# fine
# ADD packages /var/packages/
# RUN dpkg -i /var/packages/pandoc-1.16.0.2-1-amd64.deb

ADD requirements /var/config/requirements/
RUN pip3 install --break-system-packages uwsgi pyopenssl ndg-httpsclient pyasn1
RUN pip3 install --break-system-packages -r /var/config/requirements/production.txt
RUN pip3 install --break-system-packages -U django-grappelli

RUN mkdir -p /var/django/media
RUN mkdir -p /var/log/django
RUN chown -R www-data:www-data /var/django/media

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]

