#!/bin/sh
# cd /opt/share/scripts
psql -U postgres -a -f 1_postgres/1_create_db.sql
psql -U postgres -d gis -a -f 1_postgres/2_create_gis_p_schema.sql  

# run scripts to setup database
for s in $(ls 2_gis_p/*.sql)
do
    psql -U gis_p -d gis -a -f $s
done

echo COMPLETE