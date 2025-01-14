from pathlib import Path

from sophios.api.pythonapi import Step, Workflow

def workflow() -> Workflow:

    bbbcdownload = Step(clt_path='../cwl_adapters/BbbcDownaload.cwl')
    bbbcdownload.outdir 
    bbbcdownload.name = 'BBBC001'
    bbbcdownload.outDir = Path('bbbcdownload_outDir')


    steps = [
             bbbcdownload]
    filename = 'bbbc_py'  # .yml
    args = ['--container_engine', 'singularity']
    viz = Workflow(steps, filename, args)
    return viz


viz = workflow()
viz.compile() # Do NOT .run() here

if __name__ == '__main__':
    viz = workflow()
    viz.run()  # .run() here, inside main