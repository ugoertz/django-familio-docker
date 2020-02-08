# USAGE NOTES
#
# UPGRADING
# - build new container and start it (as only container) via "docker-compose up -d"
# - put the SQL dump you want to use into
#   /home/ug/docker/unserefamilie.net/unserefamilie/help (in example below the
#   file name is db25.sql)
# - run:
#   docker run --rm
#     -v /home/ug/docker/unserefamilie.net/unserefamilie/help:/backup
#     --link unserefamilie_db_1:db
#     --entrypoint=/bin/bash
#     -e "PGPASSWORD=djfu834S"
#     unserefamilie_postgis
#     -c "psql -h db djfdb djfu < /backup/db25.sql"


FROM mdillon/postgis:11
MAINTAINER Ulrich Goertz <ug@geometry.de>
# cf. https://github.com/appropriate/docker-postgis

ENV REFRESHED_AT 2019-10-01

# ENV POSTGIS_MAJOR 2.5
# ENV POSTGIS_VERSION 2.3.1+dfsg-1.pgdg80+1

# RUN apt-get update \
#       && apt-get install -y --no-install-recommends \
#            postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
#            postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts \
#            postgis-$POSTGIS_MAJOR \
#       && rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /docker-entrypoint-initdb.d
# COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh


