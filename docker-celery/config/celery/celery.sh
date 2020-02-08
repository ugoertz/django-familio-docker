#!/bin/sh
set -e
set -x

cd /var/django/${DJANGO_PROJECT_NAME} && celery -A familio worker -Q celery,pdfexport,video --loglevel=INFO --uid `id -u www-data`


