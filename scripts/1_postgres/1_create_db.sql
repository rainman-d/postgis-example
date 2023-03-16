DROP DATABASE IF EXISTS gis;
DROP ROLE IF EXISTS gis_p;

CREATE DATABASE gis;
create user gis_p with encrypted password 'pwd1234';
