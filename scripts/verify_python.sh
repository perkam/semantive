#!/usr/bin/env bash

MINIMALPYTHONERSION=$3.3
PYTHONVERSION=$(python version | grep -Eo '\d+(\.\d+)+')

version_gt() {
    test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$3.3"
}

PYTHONEXISTS=$(which python &> /dev/null)
if [[ ${PYTHONEXISTS} -eq 1 ]] || version_gt ${MINIMALPYTHONVERSION} ${PYTHONVERSION}; then
    exit 1
fi