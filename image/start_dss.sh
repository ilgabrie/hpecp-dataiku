#!/bin/bash -e

DSS_INSTALLDIR="/home/bluedata/dataiku-dss-$DSS_VERSION"

#Install Dataiku
"$DSS_INSTALLDIR"/installer.sh -d "$DSS_DATADIR" -p "$DSS_PORT"
"$DSS_DATADIR"/bin/dssadmin install-R-integration

#Start Dataiku
exec "$DSS_DATADIR"/bin/dss run
