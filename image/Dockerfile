FROM bluedata/centos7:latest

ENV DSS_VERSION="9.0.0" \
    DSS_DATADIR="/home/bluedata/dss" \
    DSS_PORT=10000

# Dataiku data dir setup
RUN mkdir -p /home/bluedata ${DSS_DATADIR} \
    && chown -Rh bluedata:bluedata /home/bluedata ${DSS_DATADIR}

# System dependencies
RUN yum install -y \
        epel-release \
    && yum install -y \
        file \
        acl \
        expat \
        git \
        nginx \
        unzip \
        zip \
        java-1.8.0-openjdk \
        python3 \
        freetype \
        libgfortran \
        libgomp \
        R-core-devel \
        libicu-devel \
        libcurl-devel \
        openssl-devel \
        libxml2-devel \
        python-devel \
        python3-devel \
    && yum clean all

# Download and extract DSS kit
RUN DSSKIT="dataiku-dss-$DSS_VERSION" \
    && cd /home/bluedata \
    && echo "+ Downloading kit" \
    && curl -OsS "https://cdn.downloads.dataiku.com/public/studio/$DSS_VERSION/$DSSKIT.tar.gz" \
    && echo "+ Extracting kit" \
    && tar xf "$DSSKIT.tar.gz" \
    && rm "$DSSKIT.tar.gz" \
    && "$DSSKIT"/scripts/install/installdir-postinstall.sh "$DSSKIT" \
    && chown -Rh bluedata:bluedata "$DSSKIT"

# Install required R packages
RUN mkdir -p /usr/local/lib/R/site-library \
    && R --slave --no-restore \
        -e "install.packages( \
            c('httr', 'RJSONIO', 'dplyr', 'curl', 'IRkernel', 'sparklyr', 'ggplot2', 'gtools', 'tidyr', \
            'rmarkdown', 'base64enc', 'filelock'), \
            '/usr/local/lib/R/site-library', \
            repos='https://cloud.r-project.org')"
# Entry point
#WORKDIR /home/bluedata
#USER bluedata

COPY start_dss.sh /home/bluedata/

EXPOSE $DSS_PORT 22

ENTRYPOINT [ "/home/bluedata/start_dss.sh" ]
