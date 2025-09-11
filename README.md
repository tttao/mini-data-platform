## Set up connectivity from Trino to Google Workspace API

In order for Trino to interact with a Google Sheet, you need to set up credentials. Those should be created in your Google Workspace account, and should then be shared with Trino.
Follow the steps described in https://trino.io/docs/current/connector/googlesheets.html#credentials, and copy the JSON file in ./trinodb/etc/gsheets-credentials.json.
An example file is provided in that same directory.

## Build the customised Trino and Superset Docker images

docker compose build --no-cache




**Services Overview**
- MinIO (minio)
S3-compatible object store.

Runs on ports 9000 (API) and 9001 (console).

- Root user/pass set to admin / password.

Data persisted under ./minio-data.

MinIO Client (mc)

Waits until MinIO is up.

Sets up an alias to MinIO.m

Deletes the bucket warehouse if it exists, then recreates it.

Applies a public policy so everything inside is accessible.

Keeps the container alive with tail -f /dev/null.

Postgres (postgresdb)

Backend DB for Hive Metastore.

Username/password: hive / hive, database metastore.

Data persisted under ./data/postgres.

Hive Metastore (hive-metastore)

Uses starburstdata/hive image.

Exposes Thrift service on port 9083.

Connects to Postgres at metastore_db:5432.

Configured with MinIO as warehouse store (s3://warehouse/).

Uses S3_PATH_STYLE_ACCESS=true (needed for MinIO).

Healthcheck ensures port 9083 is open.

Trino (trino)

Built from local ./trinodb/Dockerfile.

Exposed on 8082 (maps to container’s 8080).

Will need a catalog configured (e.g. hive.properties) pointing to Hive Metastore.

- Superset (superset)
- Built from local ./superset/Dockerfile.
- Web UI on 8088.



👉 With this setup, the intended flow is:

Data stored in MinIO (warehouse bucket).

Hive Metastore tracks metadata in Postgres.

Trino queries data via Hive Metastore.

Superset connects to Trino for BI dashboards