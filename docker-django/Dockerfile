FROM unserefamilie_base
MAINTAINER Ulrich Goertz "ug@geometry.de"

ENV REFRESHED_AT 2019-10-01

ADD ./config/uwsgi/django-uwsgi.ini /etc/uwsgi/django-uwsgi.ini
RUN mkdir /etc/service/uwsgi
ADD ./config/uwsgi/uwsgi.sh /etc/service/uwsgi/run

RUN chown -R www-data:www-data /var/log/django

EXPOSE 8000


