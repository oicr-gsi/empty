version 1.0

workflow empty {
  input {
    Int exitCode = 0
    Int n = 10
  }
  parameter_meta {
    exitCode: "Exit code"
    n: "Number of lines to log"
  }
  call getStderr
  call log as callLog {
    input:
      file = getStderr.err,
      exitCode = exitCode,
      n = n
  }
  output {
    Array[String] out = callLog.lines
  }
  meta {
    author: "Jenniffer Meng"
    email: "jenniffer.meng@oicr.on.ca"
    description: "Workflow for testing infrastructure"
    dependencies: []
  }
}

task getStderr {
  command <<< >>>
  output {
    File err = stderr()
  }
}

task log {
  input {
    File file
    Int exitCode
    Int n
    Int mem = 1
    Int timeout = 1
  }
  command <<<
  # Log n number of lines from file (stderr)
    tail -n ${n} ${file} >&2
    exit ~{exitCode}
  >>>
  runtime {
    memory: "~{mem} GB"
    timeout: "~{timeout}"
  }
  output {
    Array[String] lines = read_lines(stderr())
  }
  parameter_meta {
    file: "File from which lines will be logged"
    exitCode: "Integer used to fail as appropriate"
    n: "Number of lines to log from fileOut"
    mem: "Memory (in GB) to allocate to the job"
    modules: "Environment module name and version to load (space separated) before command execution"
    timeout: "Maximum amount of time (in hours) the task can run for"
  }
  meta {
    output_meta: {
      lines: "Lines tailed from produced stderr file"
    }
  }
}

