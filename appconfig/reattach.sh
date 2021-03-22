#!/usr/bin/env bash
#
# Copyright (c) 2020, Hewlett Packard Enterprise Development LP

SELF=${BASH_SOURCE[0]}
export CONFIG_BASE_DIR=$(dirname ${SELF})

source ${CONFIG_BASE_DIR}/logging.sh
source ${CONFIG_BASE_DIR}/utils.sh
source ${CONFIG_BASE_DIR}/macros.sh

# Add App specific configuration here.
