# Overview
This is an example repository for getting a Postgis geodatabase setup and running using Docker Compose.  It includes
scripts that can be run to setup a test geodatabase and populate with a small amount of data.

## Setup
- docker-compose.yml file has setup to make a volume and save postgres data to basic-postgis-data, change this to somewhere else if want more permanent location to save the data.
- Scripts under ./scripts folder have all the scripts to initialize a basic postgis database and also creates some sample data, including downloading gdal-tools and using it to import an Esri Shapefile as a table.
- Password for root user ```postgres``` is set in docker-compose.yml, change this to something more secure if needed
- User for gis_p schema ```gis_p``` has password set in ./scripts/1_postgres/1_create_db.sql, set this to something
else if you wish
- Scripts under ./scripts can be modified however you like to get a database provisioned, however these scripts are not automatically executed.  See ```Initializing database``` section below for commands to run them.
***Shapefile file was data taken from Portland's Open Data website:
https://gis-pdx.opendata.arcgis.com***

## Startup
In command-prompt change directories into same folder as docker-compose.yml and run:
```
docker compose up
```
- use -d flag if want to start up in detached mode

## Initializing database
Once you have the database container up and database created can run following command from this top-level folder:
```
docker exec -it $(docker ps -qf "name=gis-db") sh -c "/opt/share/scripts/master_initialize_gis_db.sh"
```
- This provisions the ```gis``` database, with ```gis_p``` schema, and creates 3 tables, along with small amount of data

Another option is to exec into container and run that script also from inside container
```
docker exec -it $(docker ps -qf "name=gis-db") bash
cd /opt/share/scripts
./master_initialize_gis_db.sh
```

Run this if want to exec into container in psql as gis_p:
```
docker exec -it $(docker ps -qf "name=gis-db") sh -c "psql -U gis_p -d gis"
```

### Additional Information
- Appears don't have to set search_path when schema name is same as user name
```
show search_path;
Output:
   search_path
-----------------
 "$user", public
```
- Otherwise if using a different user, to set search path differently:
```
set search_path to gis_p, public;
```