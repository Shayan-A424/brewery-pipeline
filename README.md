# End-to-End Cloud Data Pipeline

## Overview
An end-to-end data pipeline that ingests brewery data from a public API,
loads it into Snowflake via AWS S3 and Snowpipe, and transforms it using
dbt (staging → marts layer) with automated data quality tests.

## Architecture
Public API → Python → AWS S3 → Snowpipe → Snowflake → dbt → Mart Tables

## Tools
- Python (requests, boto3)
- AWS S3 + Snowpipe
- Snowflake
- dbt Core

## Project Structure
- `ingestion/` — Python scripts to fetch API data and upload to S3
- `brewery_pipeline/` — dbt project containing staging and mart models
- `.env` — local credentials (not tracked in GitHub)

## Status
🔧 In progress — environment configured, Snowflake connected, dbt initialized.
Next step: building Python ingestion script.

## Data Source
[Open Brewery DB](https://www.openbrewerydb.org/) — free public API,
no authentication required.
