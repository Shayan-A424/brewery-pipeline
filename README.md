# End-to-End Cloud Data Pipeline

## Overview
An end-to-end data pipeline that ingests brewery data from a public API, 
loads raw JSON into AWS S3, auto-ingests into Snowflake via Snowpipe, 
and transforms it using dbt (staging → marts layer) with 7 automated 
data quality tests passing.

## Architecture
Public API → Python → AWS S3 → Snowpipe → Snowflake → dbt → Mart Tables

## Tools
- Python (requests, boto3)
- AWS S3 + Snowpipe
- Snowflake
- dbt Core

## Project Structure
- `ingestion/` — Python script that fetches 200+ breweries from the Open 
  Brewery DB API and uploads raw JSON to S3
- `brewery_pipeline/models/staging/` — cleans and deduplicates raw data
- `brewery_pipeline/models/marts/` — two analytical models: breweries by 
  state and breweries by type

## Results
- 200+ brewery records ingested, loaded, and transformed end-to-end
- 7 dbt data quality tests passing (not_null, unique, accepted_values)
- Full staging → marts transformation layer built in Snowflake

## Status
Complete — April 2026

## Data Source
[Open Brewery DB](https://www.openbrewerydb.org/) — free public API, 
no authentication required.
