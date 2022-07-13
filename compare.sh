#!/bin/bash -x
set -o nounset
set -o errexit
set -o pipefail

# Ensure the number of outputted lines matches the number of lines expected
cat ${1}
cat ${2}
diff ${1} ${2}