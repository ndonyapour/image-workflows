#!/usr/bin/env cwl-runner
class: CommandLineTool
cwlVersion: v1.0
inputs:
  d: Directory
outputs: []
arguments:
  [echo, "$(inputs.d.listing)"]