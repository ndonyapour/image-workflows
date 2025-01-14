class: CommandLineTool
cwlVersion: v1.2
inputs:
  filePattern:
    inputBinding:
      prefix: --filePattern
    type: string?
  imageType:
    inputBinding:
      prefix: --imageType
    type: string?
  inpDir:
    inputBinding:
      prefix: --inpDir
    type: Directory
  outDir:
    inputBinding:
      prefix: --outDir
    type: Directory
  pyramidType:
    inputBinding:
      prefix: --pyramidType
    type: string
outputs:
  outDir:
    outputBinding:
      glob: $(inputs.outDir.basename)
    type: Directory
requirements:
  DockerRequirement:
    dockerPull: polusai/precompute-slide-plugin:1.7.0-dev0
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    ramMin: 10240
  NetworkAccess:
    networkAccess: true
baseCommand: ['python3', '-m', 'polus.plugins.visualization.precompute_slide']
