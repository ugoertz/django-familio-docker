These are docker files for the [Django Familio](https://github.com/ugoertz/django-familio) project.

Copy the docker-compose.yml-example file to docker-compose.yml and adapt it
according to your requirements/setup. **It is important to set appropriate
SECRET_KEY's and passwords here!** Similarly for the backup-*.sh-example
files.

The directory structure I use is the following:

    unserefamilie
    ├── backup-daily.sh
    ├── backup-daily.sh-example
    ├── backup-monthly.sh
    ├── backup-monthly.sh-example
    ├── data
    │   ├── db
    │   │   └── db*.sql
    │   ├── media
    │   │   ├── 1_pdfs
    │   │   ├── 1_uploads
    │   │   ├── 1_versions
    │   │   ├── 2_pdfs
    │   │   ├── 2_uploads
    │   │   ├── 2_versions
    │   │   ├── 3_uploads
    │   │   ├── 3_versions
    │   │   ├── latex
    │   │   ├── mugshots
    │   │   ├── pybb_upload
    │   │   └── tmp
    │   └── src
    │       └── django-familio
    ├── docker-compose.yml
    └── docker-compose.yml-example

Here data/src/django-familio contains the Django Familio git repository. Inside
the data/media directory, the prefix numbers 1_, 2_, ... relate to the
individual families/django sites (cf. below).

Some further remarks on the docker containers that are used in the
docker-compose.yml file:

* db: The database, a postgres instance with the postgis extension.
* clamav: a virus scanner; build the docker file from https://github.com/UKHomeOffice/docker-clamav.git
* family1 (, family2, ...): For each family within your instance, run one
    container. All families share the same database, but for most items
    (persons, fotos, ...), permissions can be set which control which family can
    access which item. E.g., a person could be known to several families, but
    some of the related fotos might be restricted to one of them. Within django,
    each family "is" a django "site". To gest started, just use one family.
* celery1 (, celery2, ...): Each family should have an associated container
    running django and celery. In this container, the celery tasks are executed:
    transform videos to other formats; pdf export (running xelatex); creating
    custom maps (currently not fully functional).

Since I am planning to restructure the way of creating custom maps, there are
pieces missing for this functionality in the repository at current (in
particular, you need a mapnik instance somewhere ...).

