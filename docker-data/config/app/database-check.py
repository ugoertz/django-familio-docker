#! /usr/bin/python

"""
database-check.py
This script will check whether the postgres container is up and running. It'll
connect to the database with the credentials provided in the environment
variables.
"""

import os
import sys
import psycopg2


def database_check():
    try:
        print 'database-check, try to connect'
        conn = psycopg2.connect(
            dbname=os.environ.get('POSTGRES_DB'),
            user=os.environ.get('POSTGRES_USER'),
            password=os.environ.get('POSTGRES_PASSWORD'),
            host=os.environ.get('POSTGRES_HOST'),
            port=5432)
        print 'obtain cursor'
        c = conn.cursor()
        print 'create extensions'
        c.execute('CREATE EXTENSION IF NOT EXISTS postgis;')
        c.execute('CREATE EXTENSION IF NOT EXISTS postgis_topology;')
        conn.commit()
        print 'create extensions, done'
    except:
        sys.exit(1)

    sys.exit(0)

if __name__ == "__main__":
    database_check()
