class: CommandLineTool
cwlVersion: v1.2
inputs:
  filePattern:
    inputBinding:
      prefix: --filePattern
    type: string?
  groupBy:
    inputBinding:
      prefix: --groupBy
    type: string?
  inpDir:
    inputBinding:
      prefix: --inpDir
    type: Directory
  outDir:
    inputBinding:
      prefix: --outDir
    type: Directory
  statistics:
    inputBinding:
      prefix: --statistics
    type: string
outputs:
  outDir:
    outputBinding:
      glob: $(inputs.outDir.basename)
    type: Directory
requirements:
  DockerRequirement:
    dockerPull: polusai/tabular-statistics-tool:0.1.0-dev0
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    ramMin: 10240
  NetworkAccess:
    networkAccess: true
baseCommand: ['python3', '-m', 'polus.tabular.features.tabular_statistics']