class: CommandLineTool
cwlVersion: v1.2
inputs:
  filePattern:
    inputBinding:
      prefix: --filePattern
    type: string
  getDarkfield:
    inputBinding:
      prefix: --getDarkfield
    type: boolean
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
outputs:
  outDir:
    outputBinding:
      glob: $(inputs.outDir.basename)
    type: Directory
baseCommand: ["python3", "-m", "polus.images.regression.basic_flatfield_estimation"]
requirements:
  DockerRequirement:
    dockerPull: polusai/basic-flatfield-estimation-tool:2.1.3-dev0
  ResourceRequirement:
    ramMin: 10240 # 10240 Mi
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  NetworkAccess:
    networkAccess: true
