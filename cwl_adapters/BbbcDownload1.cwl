class: CommandLineTool
cwlVersion: v1.2
inputs:
  name:
    inputBinding:
      prefix: --name
    type: string

arguments:
 - --outDir
 - $(runtime.outdir)

outputs:
  outDir:
    type: Directory
    outputBinding:
      glob: $(runtime.outdir)
  #   loadListing: deep_listing

  output_files:
    type: File[]
    outputBinding:
      outputEval: |
        ${
          var tifFiles = [];
          
          function findTifFiles(dir) {
            for (var item of dir.listing) {
              if (item.class == 'Directory') {
                findTifFiles(item); // Recursively search subdirectories
              } else if (item.class == 'File' && item.basename.endsWith('.tif')) {
                tifFiles.push({ "class": "File", "path": item.path });
              }
            }
          }
          
          findTifFiles(inputs.outDir);
          return tifFiles;
        }      
baseCommand: ["python3", "-m", "polus.plugins.utils.bbbc_download"]
hints:
  DockerRequirement:
    dockerPull: polusai/bbbc-download-plugin:0.1.0-dev1
requirements:
  InlineJavascriptRequirement: {}
  NetworkAccess:
    networkAccess: true