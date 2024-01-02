FROM mcr.microsoft.com/mssql/server:2019-latest
ADD ./init_data /opt/data/init_data
ADD ./entrypoint.sh /opt/data/entrypoint.sh
ADD ./import.sh /opt/data/import.sh

WORKDIR /opt/data/
USER root
RUN chmod +x entrypoint.sh
RUN chmod +x import.sh

ENTRYPOINT ["./entrypoint.sh"]
