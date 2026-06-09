# FEniCSx and DOLFINx on SciClone Jupyter

This directory documents how to create a DOLFINx conda environment for use with the [SciClone Jupyter notebook server](https://notebooks.sciclone.wm.edu/).

DOLFINx is part of the FEniCS project and is useful for finite element simulations and related computational modeling workflows.

## Resources

- [DOLFINx GitHub repository](https://github.com/FEniCS/dolfinx)
- [FEniCS Project](https://fenicsproject.org/)
- [FEniCS documentation](https://fenicsproject.org/documentation/)
- [FEniCS tutorial](https://fenicsproject.org/pub/tutorial/html/ftut1.html)

## Create the Conda Environment

Create and activate a new environment:

```bash
conda create -n fenicsx-env
conda activate fenicsx-env
```

Install DOLFINx and supporting packages from `conda-forge`:

```bash
conda install -c conda-forge fenics-dolfinx mpich pyvista
```

Install `ipykernel` so the environment can be used as a Jupyter notebook kernel:

```bash
conda install ipykernel
```

Register the environment as a Jupyter kernel:

```bash
python -m ipykernel install --user --name fenicsx-env --display-name fenicsx
```

After this step, a new Jupyter launcher named `fenicsx` should appear.

## Configure the Kernel Path

SciClone Jupyter notebooks maintain their own environment, so you may need to set the kernel's `PATH` manually.

Edit the kernel configuration file:

```bash
/home/USERNAME/.local/share/jupyter/kernels/fenicsx-env/kernel.json
```

Replace `USERNAME` with your SciClone username.

The file should include an `env` section that points to the conda environment's `bin` directory. For example:

```json
{
  "argv": [
    "/home/USERNAME/.conda/envs/fenicsx-env/bin/python",
    "-Xfrozen_modules=off",
    "-m",
    "ipykernel_launcher",
    "-f",
    "{connection_file}"
  ],
  "env": {
    "PATH": "/home/USERNAME/.conda/envs/fenicsx-env/bin:/usr/local/bin:/usr/bin:/bin"
  },
  "display_name": "fenicsx",
  "language": "python",
  "metadata": {
    "debugger": true
  },
  "kernel_protocol_version": "5.5"
}
```

After saving `kernel.json`, restart the SciClone Jupyter server and open a notebook using the `fenicsx` kernel.



## Further Reading

Automated Solution of Differential Equations by the Finite Element Method: The FEniCS Book (Lecture Notes in Computational Science and Engineering, 84)

 