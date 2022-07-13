#!/bin/bash
set -o nounset
set -o errexit
set -o pipefail

# Get the number of lines from the produced output files
for f in ${1} ; do
  wc -l ${f} | md5sum
done
