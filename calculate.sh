#!/bin/bash
set -o nounset
set -o errexit
set -o pipefail

# Loop through all files in directory and output the number of lines they have
for f in * ; do
  wc -l ${f} | md5sum
done
