#!/bin/bash -x
set -o nounset
set -o errexit
set -o pipefail

# Loop through all files in directory and output the number of lines they have
for f in * ; do
  echo ${f}
  wc -l ${f}
done
