CREATE USER opxuser WITH PASSWORD 'opx_dev_pass';
CREATE DATABASE opx_dev;
ALTER DATABASE opx_dev OWNER TO opxuser;
\c opx_dev
CREATE SCHEMA opx AUTHORIZATION opxuser;
ALTER SCHEMA opx OWNER TO opxuser;
