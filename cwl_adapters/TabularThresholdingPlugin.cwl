class: CommandLineTool
cwlVersion: v1.2
inputs:
  falsePositiverate:
    inputBinding:
      prefix: --falsePositiverate
    type: double?
  filePattern:
    inputBinding:
      prefix: --filePattern
    type: string?
  inpDir:
    inputBinding:
      prefix: --inpDir
    type: Directory
  n:
    inputBinding:
      prefix: --n
    type: double?
  negControl:
    inputBinding:
      prefix: --negControl
    type: string
  numBins:
    inputBinding:
      prefix: --numBins
    type: double?
  outDir:
    inputBinding:
      prefix: --outDir
    type: Directory
  posControl:
    inputBinding:
      prefix: --posControl
    type: string?
  thresholdType:
    inputBinding:
      prefix: --thresholdType
    type: string
  varName:
    inputBinding:
      prefix: --varName
    type: string
outputs:
  outDir:
    outputBinding:
      glob: $(inputs.outDir.basename)
    type: Directory
requirements:
  DockerRequirement:
    dockerPull: polusai/tabular-thresholding-tool:0.1.8-dev2
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    ramMin: 10240
  NetworkAccess:
    networkAccess: true
baseCommand: ['python3', '-m', 'polus.tabular.transforms.tabular_thresholding']