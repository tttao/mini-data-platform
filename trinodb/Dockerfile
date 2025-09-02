FROM trinodb/trino:476

USER trino

COPY ./catalog/covid.properties /etc/trino/catalog/
COPY ./catalog/hive.properties /etc/trino/catalog/
COPY ./etc/gsheets-credentials.json /etc/trino/