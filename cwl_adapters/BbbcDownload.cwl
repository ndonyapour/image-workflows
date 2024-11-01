class: CommandLineTool
cwlVersion: v1.2
inputs:
  name:
    inputBinding:
      prefix: --name
    type: string
  outDir:
    inputBinding:
      prefix: --outDir
    type: Directory

outputs:
  outDir:
    outputBinding:
      glob: $(inputs.outDir.basename)
    type: Directory
    
baseCommand: ["python3", "-m", "polus.plugins.utils.bbbc_download"]
requirements:
  DockerRequirement:
    dockerPull: polusai/bbbc-download-plugin:0.1.0-dev1
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs.outDir)
      writable: true
  InlineJavascriptRequirement: {}
  NetworkAccess:
    networkAccess: true
