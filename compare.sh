#!/bin/bash
set -o nounset
set -o errexit
set -o pipefail

# Ensure the number of outputted lines matches the number of lines expected
diff ${1} ${2}