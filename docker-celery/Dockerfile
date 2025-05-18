FROM unserefamilie_base
MAINTAINER Ulrich Goertz "ug@geometry.de"

ENV REFRESHED_AT 2016-12-27

RUN apt-get update
RUN apt-get install -y texlive-full
RUN apt-get install -y imagemagick
RUN apt-get install -y qpdf
# RUN apt-get install -y phantomjs
RUN apt-get install -y fonts-vollkorn
RUN apt-get install -y ffmpeg

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# In order to include family trees in PDF exports,
# put a PhamtomJS binary in ./phantomjs/ (not included in this repository).
ADD ./phantomjs/phantomjs /usr/local/bin/

# fix ImageMagick permission problem
RUN sed -i 's#<policy domain="coder" rights="none" pattern="PDF" />#<policy domain="coder" rights="read|write" pattern="PDF" />#' /etc/ImageMagick-6/policy.xml

RUN chown www-data:www-data /var/log/django

RUN mkdir /etc/service/celery
ADD ./config/celery/celery.sh /etc/service/celery/run

