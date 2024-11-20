class: CommandLineTool
cwlVersion: v1.2
inputs:
  binarizationThreshold:
    inputBinding:
      prefix: --binarizationThreshold
    type: double
  connectivity:
    inputBinding:
      prefix: --connectivity
    type: int
  inpDir:
    inputBinding:
      prefix: --inpDir
    type: Directory
  outDir:
    inputBinding:
      prefix: --outDir
    type: Directory
outputs:
  outDir:
    outputBinding:
      glob: $(inputs.outDir.basename)
    type: Directory
baseCommand: ["python3", "main"]
requirements:
  DockerRequirement:
    dockerPull: polusai/ftl-label-plugin:0.3.12-dev5
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  NetworkAccess:
    networkAccess: true
