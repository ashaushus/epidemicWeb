CREATE DATABASE epidemics;

 \connect epidemics
 CREATE USER epidemics PASSWORD 'epidemics' inherit;

 ALTER USER epidemics WITH superuser;

grant all privileges on database epidemics to epidemics;

 CREATE SCHEMA epidemics
     AUTHORIZATION epidemics;

 GRANT ALL ON SCHEMA epidemics TO epidemics;

 CREATE TABLE epidemics.asha_sample (
    id           INTEGER NOT NULL,
    DESCRIPTION  VARCHAR(36) DEFAULT '' NOT NULL,
    PRIMARY KEY ( id )
);