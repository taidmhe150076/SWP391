#!/bin/bash
( /opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" && /opt/data/import.sh

tail -f /dev/null
