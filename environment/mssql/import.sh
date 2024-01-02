#!/bin/bash

exist=$(/opt/mssql-tools/bin/sqlcmd -S localhost -l 60 -U sa -P ${MSSQL_SA_PASSWORD} -d master -h -1 -Q "SELECT count(*) FROM sys.databases where name = 'sampledb';")
echo "-------------------------------------------"
echo $exist
exist_ns=`echo $exist | sed -e 's/^[[:space:]]*//'`
if [[ "$exist_ns" =~ ^0.* ]];
then
    for i in {1..50};
    do
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${MSSQL_SA_PASSWORD} -d master -Q "CREATE DATABASE sampledb;"
        if [ $? -eq 0 ]
        then
            echo "database sampledb created"
            break
        else
            echo "not ready yet..."
            sleep 1
        fi
    done

    SQL_FILES=()
    while read p; do
        SQL_FILES+=("/opt/data/init_data/$p")
    done < exec_sqls
    for p in "${SQL_FILES[@]}"
    do
        printf '\nExecuting %s ...\n' "$p"
        if [ -f "$p" ]; then 
            /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${MSSQL_SA_PASSWORD} -d sampledb -i $p
            echo "Executed $p ..."
        fi
    done
    echo "Import DONE"
fi
eval $1
