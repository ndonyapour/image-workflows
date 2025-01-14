class: CommandLineTool
cwlVersion: v1.2
inputs:
  features:
    inputBinding:
      prefix: --features
    type: string?
  fileExtension:
    inputBinding:
      prefix: --fileExtension
    type: string
  inpDir:
    inputBinding:
      prefix: --inpDir
    type: Directory
  intPattern:
    inputBinding:
      prefix: --intPattern
    type: string
  neighborDist:
    inputBinding:
      prefix: --neighborDist
    type: double?
  outDir:
    inputBinding:
      prefix: --outDir
    type: Directory
  pixelPerMicron:
    inputBinding:
      prefix: --pixelPerMicron
    type: double?
  segDir:
    inputBinding:
      prefix: --segDir
    type: Directory
  segPattern:
    inputBinding:
      prefix: --segPattern
    type: string
  singleRoi:
    inputBinding:
      prefix: --singleRoi
    type: boolean?
outputs:
  outDir:
    outputBinding:
      glob: $(inputs.outDir.basename)
    type: Directory
requirements:
  DockerRequirement:
    dockerPull: polusai/nyxus-tool:0.1.8-dev1
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  ResourceRequirement:
    ramMin: 10240
  NetworkAccess:
    networkAccess: true
baseCommand: ['python3', '-m', 'polus.images.features.nyxus_tool']