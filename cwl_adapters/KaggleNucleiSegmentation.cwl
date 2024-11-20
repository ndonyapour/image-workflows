class: CommandLineTool
cwlVersion: v1.2
inputs:
  filePattern:
    inputBinding:
      prefix: --filePattern
    type: string?
  inpDir:
    inputBinding:
      prefix: --inpDir
    type: Directory
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
baseCommand: ["python3", "-m", "polus.images.segmentation.kaggle_nuclei_segmentation"]
requirements:
  DockerRequirement:
    dockerPull: polusai/kaggle-nuclei-segmentation-tool:0.1.5-dev1
  ResourceRequirement:
    ramMin: 10240 # 10240 Mi
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  NetworkAccess:
    networkAccess: true
