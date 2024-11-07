class: CommandLineTool
cwlVersion: v1.2
inputs:
  dfPattern:
    inputBinding:
      prefix: --dfPattern
    type: string?
  ffDir:
    inputBinding:
      prefix: --ffDir
    type: Directory
  ffPattern:
    inputBinding:
      prefix: --ffPattern
    type: string
  imgDir:
    inputBinding:
      prefix: --imgDir
    type: Directory
  imgPattern:
    inputBinding:
      prefix: --imgPattern
    type: string
  outDir:
    inputBinding:
      prefix: --outDir
    type: Directory
  preview:
    inputBinding:
      prefix: --preview
    type: boolean?
outputs:
  outDir:
    outputBinding:
      glob: $(inputs.outDir.basename)
    type: Directory
baseCommand: ["python3", "-m", "polus.images.transforms.images.apply_flatfield"]
requirements:
  DockerRequirement:
    dockerPull: polusai/apply-flatfield-tool:2.0.1
  # EnvVarRequirement:
  #   envDef:
  #     HOME: /home/polusai
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  NetworkAccess:
    networkAccess: true
