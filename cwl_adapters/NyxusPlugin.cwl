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
baseCommand: ["python3", "-m", "polus.images.features.nyxus_tool"]
requirements:
  DockerRequirement:
    dockerPull: polusai/nyxus-tool:0.1.8-dev0
  EnvVarRequirement:
    envDef:
      HOME: /home/polusai
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  NetworkAccess:
    networkAccess: true
