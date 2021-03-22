#!/bin/bash -e

DSS_INSTALLDIR="/home/bluedata/dataiku-dss-$DSS_VERSION"
DSS_DATADIR="/home/bluedata/dss"

#Install Dataiku
/bin/su bluedata -c "${DSS_INSTALLDIR}/installer.sh -d ${DSS_DATADIR} -p 10000"
/bin/su bluedata -c "${DSS_DATADIR}/bin/dssadmin install-R-integration"

#Start Dataiku
/bin/su bluedata -c "${DSS_DATADIR}/bin/dss start"

exec /sbin/init
