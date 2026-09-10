SHOW DATABASES;


-- Remember to make this idempotent
CREATE DATABASE IF NOT EXISTS DEMO_DB;

CREATE SCHEMA IF NOT EXISTS DEMO_DB.staging;

CREATE TABLE IF NOT EXISTS customer (
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar(50)
);

INSERT INTO customer (customer_id, age, email)
VALUES
(1, 32, 'abc@gmail.com'),
(2, 24, 'cdf@gmail.com'),
(3, 69, 'efg@gmail.com');

SELECT * FROM customer;

DROP DATABASE DEMO_DB;