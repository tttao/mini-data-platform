FROM trinodb/trino:476

USER trino

COPY ./catalog/staging.properties /etc/trino/catalog/
COPY ./catalog/integration.properties /etc/trino/catalog/
COPY ./etc/gsheets-credentials.json /etc/trino/