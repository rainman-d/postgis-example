set search_path to gis_p, public;
DROP TABLE IF EXISTS transformer;
DROP TABLE IF EXISTS primary_conductor;
DROP TABLE IF EXISTS parcel;
DROP SEQUENCE IF EXISTS gis_fid_seq;

CREATE SEQUENCE IF NOT EXISTS gis_fid_seq START 1;
create table transformer (id serial, fid integer DEFAULT nextval('gis_fid_seq') not null, transformer_id varchar not null, geom geometry(Point, 4326) not null);
create table primary_conductor (id serial, fid integer DEFAULT nextval('gis_fid_seq') not null, geom geometry(Linestring, 4326) not null);
create table parcel (id serial, fid integer DEFAULT nextval('gis_fid_seq') not null, geom geometry(Polygon, 4326) not null);
