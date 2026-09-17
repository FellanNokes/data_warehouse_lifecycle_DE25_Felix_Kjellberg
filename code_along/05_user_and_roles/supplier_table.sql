USE ROLE ice_cream_writer;
USE WAREHOUSE dev_wh;
USE SCHEMA ice_cream_db.public;
CREATE TABLE IF NOT EXISTS suppliers(
    supplier_id INT AUTOINCREMENT,
    supplier_naame VARCHAR(255),
    adress VARCHAR(255)
);


USE ROLE SECURITYADMIN;

GRANT ROLE ice_cream_writer TO ROLE SYSADMIN;

USE ROLE SYSADMIN;

DROP TABLE suppliers;