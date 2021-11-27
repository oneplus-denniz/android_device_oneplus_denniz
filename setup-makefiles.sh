#!/bin/bash
# setup vendor makefiles

set -e

#####################  SETTINGS  #####################
export DEVICE=OP515BL1
export VENDOR=oneplus
######################################################

INITIAL_COPYRIGHT_YEAR=2021

# load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# initialize the helper for device
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false

# copyright headers and guards
write_headers "OP515BL1"

# the standard blobs
write_makefiles "${MY_DIR}/proprietary-files.txt" true

# finish
write_footers
