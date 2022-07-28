# emptyLog

Workflow to log n lines from a file and exit as specified.

## Overview

## Dependencies
-

## Usage

### Cromwell

```
java -jar cromwell.jar run empty --inputs inputs.json
```

### Inputs

#### Required Workflow Parameters:
Parameter | Type | Description
---|--|---
'dummyInput' | File | Dummy input to run the workflow
'exitCode' | Int | Code to fail the workflow as needed
'n' | Int | Number of lines to log

### Outputs
Output | Type | Description
---|--|---
'err' | File | Tail of stderr (with n lines)

### Commands
