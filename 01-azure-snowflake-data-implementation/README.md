# Azure + Snowflake Data Implementation Pipeline

## Overview
This project demonstrates an end-to-end data implementation workflow for customer, policy, and claims-style datasets.

## Architecture
1. Source data arrives from APIs, databases, or files.
2. Azure Data Factory ingests data into Azure Data Lake.
3. Python validation checks schema, duplicates, nulls, and record counts.
4. Curated datasets are prepared for Snowflake.
5. Snowflake SQL creates reporting-ready tables.
6. Metadata and lineage documents track data flow.

## Skills
Azure Data Factory, Azure Data Lake, Snowflake, SQL, Python, Data Quality, Metadata Management, Data Lineage, ETL/ELT.
