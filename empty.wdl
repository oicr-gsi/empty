version 1.0

workflow empty {
  input {
    Int exitCode = 1
    Int n = 10
  }
  parameter_meta {
    exitCode: "Exit code"
    n: "Number of lines to log"
  }
  call log as callLog {
    inputs:
      fileOut = stderr()
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

task log {
  input {
    File fileOut
    Int exitCode
    Int n
    Int mem = 1
    String modules = ""
    Int timeout = 1
  }
  command {
  # Log n number of lines from fileOut (stderr)
    tail -n ${n} ${fileOut}
    exit ~{exitCode}
  }
  runtime {
    memory: "~{mem} GB"
    modules: "~{modules}"
    timeout: "~{timeout}"
  }
  output {
    Array[String] lines = read_lines(stdout())
  }
  parameter_meta {
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

