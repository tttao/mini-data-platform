## Required software (prerequisites)

- Python
- Docker

## Deployment procedure

### Set up connectivity from Trino to Google Workspace API

In order for Trino to interact with a Google Sheet, you need to set up credentials. Those should be created in your Google Workspace account, and should then be shared with Trino.
Follow the steps described in https://trino.io/docs/current/connector/googlesheets.html#credentials, and copy the JSON file in `./trinodb/etc/gsheets-credentials.json`.
An example file is provided in that same directory.

### Install the Python modules

(optional) Use a Python virtual environment: `python -m venv .venv`
Install the Python modules (`dbt-core` and `dbt-trino`), required for DBT (the transformation engine):

`pip -r requirements.txt`

### Build the customised Trino and Superset Docker images

`docker compose build --no-cache`

### Run the containers

`docker compose up -d`

### Configure Apache Superset

**Services Overview (what is deployed) **
1. MinIO (`minio`)
- S3-compatible object store.
- Runs on ports 9000 (API) and 9001 (console).
- Root user/pass set to `admin` / `password`.
- Data persisted under `./minio-data`.

2. MinIO Client (`mc`)
- Waits until MinIO is up.
- Sets up an alias to MinIO.
- On container creation: deletes the bucket `warehouse` if it exists, then recreates it.
- Applies a public policy so everything inside is accessible.
- Keeps the container alive with `tail -f /dev/null`.

3. Postgres (`postgresdb`)
- Backend DB for `Hive Metastore`.
- Username/password: `hive` / `hive`, database `metastore`.
- Data persisted under `./data/postgres`.

4. Hive Metastore (`hive-metastore`)
- Uses `starburstdata/hive` image.
- Exposes Thrift service on port 9083.
- Connects to Postgres at `metastore_db:5432`.
- Configured with MinIO as warehouse store (`s3://warehouse/`).
- Uses `S3_PATH_STYLE_ACCESS=true` (needed for MinIO).
- Healthcheck ensures port 9083 is open.

5. Trino (`trino`)
- Built from local `./trinodb/Dockerfile`.
- Exposed on 8082 (maps to container’s 8080).
- 1 catalog is configured pointing to Google Sheets source data
- 1 catalog is configured pointing to Hive Metastore for use by Superset (BI)

6. Superset (`superset`)
- Built from local `./superset/Dockerfile`.
- Web UI on 8088.
- Admin credentials: `admin` / `admin`
**Overall flow**

- Data from Google Sheets ingested and stored using Delta Lake (parquet files) in MinIO (warehouse bucket).
- Hive Metastore tracks metadata in Postgres.
- Trino reads source data via Google Sheets Connector, and write data using Delta Lake Connector.
- Superset reads consolidated data in  Delta Lake Tables via Hive for BI dashboards



Configure Superset:

login on http//localhost:8088 (admin/admin)
Settings -> Database Connections
Add two connections to Trino:
- Trino STG : trino://trino@trino/stg
- Trino INT : trino://trino@trino/int