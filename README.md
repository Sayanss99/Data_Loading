# S3 to Snowflake Data Loading Automation

This repository contains a Python script for a generic job to streamline the process of loading data from Amazon S3 into Snowflake tables. The script utilizes the Snowflake connector to dynamically generate COPY commands and maintains a comprehensive audit table and rejected records table, storing critical information about the data loading process. By updating a metadata template CSV file, users or data analysts can seamlessly configure and execute data loading operations without delving into the intricacies of scripting.

## Project Architecture

![Project Architecture]([path/to/your/architecture/image.png](https://github.com/Sayanss99/Data_Loading/blob/main/Architecture%20%20of%20the%20generic%20Job%20to%20ingest%20data%20from%20s3%20to%20Snowflake.png))

### Components:
- **Python Script (`s3_to_snowflake_loader.py`):**
  - This script is the core of the data loading automation. It dynamically creates COPY commands based on the metadata provided in the CSV file and executes them to load data from S3 to Snowflake.
  - It also generates INSERT statements to update the audit table with information on each data loading operation.

- **SQL Script (`ddl_queries.sql`):**
  - This script contains the necessary DDL queries to set up tables in Snowflake, including the target tables and the audit table for tracking data loading activities.

- **Metadata Template CSV File (`metadata_template.csv`):**
  - Users need to update this file with specific details like database, schema, table, S3 stage, Snowflake warehouse, and file format names.
  - The Python script reads this file to dynamically generate COPY commands and INSERT statements.

## Setup Instructions

### Snowflake Configuration:
1. Execute the DDL queries from `ddl_queries.sql` in Snowflake to create the required databases and tables.

### Python Script Configuration:
1. Install the required dependencies: `pip install snowflake-connector-python pandas`.

2. Update the Snowflake and S3 credentials in the script.

3. Modify the `metadata_template.csv` file with the necessary details for each data loading task.

4. Modify the python script `s3_to_snowflake_loader.py` with your own Snowflake credentials or you can use Snowflake Key pair Authentication too.
   
5. Execute the Python script using `python s3_to_snowflake_loader.py`.

## Audit Tables

### AUDIT TABLE
The `AUDIT_TABLE` captures essential information for each data loading operation:

- **QUERY_ID:** Unique identifier for each run.
- **QUERY_TEXT:** The text of the rejected query.
- **DATABASE_NAME:** Name of the Snowflake database.
- **ROWS_INSERTED:** Number of rows successfully inserted.
- **ROWS_REJECTED:** Number of rows rejected during the execution.
- **SCHEMA_NAME:** Name of the Snowflake schema.
- **ROLE_NAME:** Name of the Snowflake role.
- **WAREHOUSE_NAME:** Name of the Snowflake warehouse.
- **WAREHOUSE_SIZE:** Size of the Snowflake warehouse.
- **EXECUTION_STATUS:** Status of the query execution (success/failure).
- **ERROR_MESSAGE:** Error message in case of failure.
- **EXECUTION_TIME:** Time taken for query execution.
- **ETL_TS:** Timestamp of the ETL operation.

### COPY_CMD_REJECTS

The `COPY_CMD_REJECTS` table captures rejected queries during the COPY command execution:

- **QUERY_ID:** Unique identifier for each run.
- **TABLE_NAME:** Name of the target table in Snowflake.
- **LOAD_DATE:** Date and time of the data loading operation.
- **ERROR:** Error details if any during the loading process.
- **FILE:** Name of the file being loaded.
- **LINE:** Line number in the file where the error occurred.
- **CHARACTER:** Character in the line where the error occurred.
- **BYTE_OFFSET:** Byte offset of the error in the file.
- **CATEGORY:** Error category.
- **CODE:** Error code.
- **SQL_STATE:** SQL state of the error.
- **COLUMN_NAME:** Name of the column where the error occurred.
- **ROW_NUMBER:** Number of the row where the error occurred.
- **ROW_START_LINE:** Line number where the row starts.
- **REJECTED_RECORD:** The rejected record in case of an error.

## Example Usage

1. Configure the metadata in `metadata_template.csv`.

2. Run the Python script: `python s3_to_snowflake_loader.py`.

3. Check the audit table (`AUDIT_TABLE`) for the status and details of the data loading operation.

Refer to the code and architecture image in the repository for a more detailed understanding.
