--drop database if required
drop database if exists prj_1;
--Create Database
create database if not exists prj_1;
--use the database
use prj_1;

--required table creation
create or replace TABLE prj_1.PUBLIC.COPY_CMD_REJECTS (
	QUERY_ID VARCHAR(16777216),
	TABLE_NAME VARCHAR(100),
	LOAD_DATE TIMESTAMP_LTZ(9),
	ERROR VARCHAR(16777216),
	FILE VARCHAR(16777216),
	LINE NUMBER(18,0),
	CHARACTER NUMBER(18,0),
	BYTE_OFFSET NUMBER(18,0),
	CATEGORY VARCHAR(16777216),
	CODE NUMBER(18,0),
	SQL_STATE VARCHAR(16777216),
	COLUMN_NAME VARCHAR(16777216),
	ROW_NUMBER NUMBER(18,0),
	ROW_START_LINE NUMBER(18,0),
	REJECTED_RECORD VARCHAR(16777216)
);

create or replace TABLE prj_1.PUBLIC.COPY_AUDIT (
	QUERY_ID VARCHAR(16777216),
	QUERY_TEXT VARCHAR(16777216),
	DATABASE_NAME VARCHAR(16777216),
	ROWS_INSERTED VARCHAR(16777216),
	ROWS_REJECTED VARCHAR(16777216),
	SCHEMA_NAME VARCHAR(16777216),
	ROLE_NAME VARCHAR(16777216),
	WAREHOUSE_NAME VARCHAR(16777216),
	WAREHOUSE_SIZE VARCHAR(16777216),
	EXECUTION_STATUS VARCHAR(16777216),
	ERROR_MESSAGE VARCHAR(16777216),
	EXECUTION_TIME NUMBER(38,0),
	ETL_TS TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP()
);

// Create storage integration object
--stage creation
create or replace stage prj_1.PUBLIC.snow_simple url="s3://{}/" 
credentials = (aws_key_id = '{}' aws_secret_key = '{}');


list @prj_1.PUBLIC.snow_simple;

--file-format creation
create or replace file format my_csv_format
type = csv field_delimiter = ',' skip_header = 1
field_optionally_enclosed_by = '"'
null_if = ('NULL', 'null') 
empty_field_as_null = true;


  
  


--Table Creation for experiment
create or replace table  iris_flower (sepal_length number(10,4),sepal_width number(10,4),petal_length number(10,4)  ,petal_width number(10,4),species varchar(200));

create or replace TABLE customer (
	Index number,
    CustomerId varchar,
    First_Name varchar,
    Last_Name varchar,
    Company varchar,
    City varchar,
    Country varchar,
    Email varchar,
    Website varchar);




select * from prj_1.PUBLIC.iris_flower; 

select * from prj_1.PUBLIC.customer;



SELECT * FROM  prj_1.PUBLIC.COPY_CMD_REJECTS ;

SELECT * FROM prj_1.PUBLIC.COPY_AUDIT;


--drop database if required
drop database if exists Demo2;
--Create Database
create database if not exists Demo2;
--use the database
use Demo2;

--required table creation
create or replace TABLE Demo2.PUBLIC.COPY_CMD_REJECTS (
	QUERY_ID VARCHAR(16777216),
	TABLE_NAME VARCHAR(100),
	LOAD_DATE TIMESTAMP_LTZ(9),
	ERROR VARCHAR(16777216),
	FILE VARCHAR(16777216),
	LINE NUMBER(18,0),
	CHARACTER NUMBER(18,0),
	BYTE_OFFSET NUMBER(18,0),
	CATEGORY VARCHAR(16777216),
	CODE NUMBER(18,0),
	SQL_STATE VARCHAR(16777216),
	COLUMN_NAME VARCHAR(16777216),
	ROW_NUMBER NUMBER(18,0),
	ROW_START_LINE NUMBER(18,0),
	REJECTED_RECORD VARCHAR(16777216)
);

create or replace TABLE Demo2.PUBLIC.COPY_AUDIT (
	QUERY_ID VARCHAR(16777216),
	QUERY_TEXT VARCHAR(16777216),
	DATABASE_NAME VARCHAR(16777216),
	ROWS_INSERTED VARCHAR(16777216),
	ROWS_REJECTED VARCHAR(16777216),
	SCHEMA_NAME VARCHAR(16777216),
	ROLE_NAME VARCHAR(16777216),
	WAREHOUSE_NAME VARCHAR(16777216),
	WAREHOUSE_SIZE VARCHAR(16777216),
	EXECUTION_STATUS VARCHAR(16777216),
	ERROR_MESSAGE VARCHAR(16777216),
	EXECUTION_TIME NUMBER(38,0),
	ETL_TS TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP()
);



// Create storage integration object
--stage creation
create or replace stage Demo2.PUBLIC.second_stage url="s3://{}/" 
credentials = (aws_key_id = '{}' aws_secret_key = '{}');

--file-format creation
create or replace file format Demo2.PUBLIC.json_format_strip_outer_array
  type = 'json' STRIP_OUTER_ARRAY=TRUE;  
  
 
create OR REPLACE table Demo2.PUBLIC.json_testing_with_array(jsoncolumntesting variant);
 
select * from Demo2.PUBLIC.json_testing_with_array;
 
SELECT * FROM  Demo2.PUBLIC.COPY_CMD_REJECTS;

SELECT * FROM Demo2.PUBLIC.COPY_AUDIT;
 