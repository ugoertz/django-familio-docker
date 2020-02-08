#! /bin/bash


#####
# Postgres: wait until container is created
# 
# $?                most recent foreground pipeline exit status
# > /dev/null 2>&1  get stderr while discarding stdout
#####
/var/config/database-check.py
while [[ $? != 0 ]] ; do
    sleep 1; echo "*** Waiting for postgres container ..."
    /var/config/database-check.py
done

echo "Postgres server is running."
env

mkdir -p /var/django/${DJANGO_PROJECT_NAME}/tmp
chown -R www-data:www-data /var/django/${DJANGO_PROJECT_NAME}/tmp
chown -R www-data:www-data /var/django/${DJANGO_PROJECT_NAME}/static
chown -R www-data:www-data /var/django/media
chown -R www-data:www-data /var/log/django


#####
# Django setup
#####

# Django: collectstatic
sudo -u www-data -E python /var/django/${DJANGO_PROJECT_NAME}/manage.py collectstatic --noinput --settings=${DJANGO_SETTINGS_MODULE}

# Django: syncdb
sudo -u www-data -E python /var/django/${DJANGO_PROJECT_NAME}/manage.py migrate --settings=${DJANGO_SETTINGS_MODULE}

