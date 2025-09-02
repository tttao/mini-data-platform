FROM apache/superset:GHA-17336877122

USER root

ENV SUPERSET_CONFIG_PATH /app/superset_config.py
ENV ADMIN_EMAIL $ADMIN_EMAIL
ENV ADMIN_PASSWORD $ADMIN_PASSWORD

COPY ./superset-init.sh /superset-init.sh

COPY superset_config.py /app/

USER superset

ENTRYPOINT [ "/superset-init.sh" ]
