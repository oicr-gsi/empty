# empty

Workflow for testing infrastructure

## Overview

## Dependencies



## Usage

### Cromwell
```
java -jar cromwell.jar run empty.wdl --inputs inputs.json
```

### Inputs

#### Required workflow parameters:
Parameter|Value|Description
---|---|---
`dummyInput`|File|File from Vidarr


#### Optional workflow parameters:
Parameter|Value|Default|Description
---|---|---|---
`exitCode`|Int|0|Exit code
`n`|Int|10|Number of lines to log to stderr


#### Optional task parameters:
Parameter|Value|Default|Description
---|---|---|---
`log.mem`|Int|1|Memory (in GB) to allocate to the job
`log.timeout`|Int|1|Maximum amount of time (in hours) the task can run for


### Outputs

Output | Type | Description | Labels
---|---|---|---
`stdout`|File|stdout lines produced|vidarr_label: stdout
`stderr`|File|stderr lines produced|vidarr_label: stderr


## Commands
 This section lists command(s) run by WORKFLOW workflow
 
 * Running WORKFLOW
 
 === Description here ===.
 
 <<<
     set -euo pipefail
     # Output n lines to stderr
     for (( i = 1; i <= ~{n}; i++ )) ; do
       echo "This is a place holder stdout line ${i}"
       echo "This is a place holder stderr line ${i}" 1>&2
     done
     exit ~{exitCode}
   >>>
 ## Support

For support, please file an issue on the [Github project](https://github.com/oicr-gsi) or send an email to gsi@oicr.on.ca .

_Generated with generate-markdown-readme (https://github.com/oicr-gsi/gsi-wdl-tools/)_
