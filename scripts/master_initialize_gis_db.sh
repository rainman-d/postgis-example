#!/bin/bash
cd /opt/share/scripts/

echo 1 - Initializing gis database
./init_gis_db.sh

echo 2 - Installing gdal tools
./install_gdal-tools.sh

echo 3 - Importing portland buildings shapefile
./import_buildings.sh

echo COMPLETED gis database initialization