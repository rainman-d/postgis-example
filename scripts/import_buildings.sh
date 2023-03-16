#!/bin/bash
cd /opt/share/scripts/shapefile/

ogr2ogr -f "PostgreSQL" PG:"host=localhost user=gis_p dbname=gis password=pwd1234 active_schema=gis_p" \
Buildings.shp -nln portland_buildings

echo COMPLETE
