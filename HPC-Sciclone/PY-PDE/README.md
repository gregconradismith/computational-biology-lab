# py-pde on SciClone

This directory contains notes for installing [`py-pde`](https://github.com/zwicker-group/py-pde) on W&M's SciClone system using conda.

`py-pde` is a Python package for solving partial differential equations with finite differences. It provides grids, scalar and tensor fields, differential operators, and time-stepping tools for exploratory PDE modeling.

## Resources

- [py-pde GitHub repository](https://github.com/zwicker-group/py-pde)
- [py-pde documentation](https://py-pde.readthedocs.io/en/latest/)
- [py-pde getting started guide](https://py-pde.readthedocs.io/en/latest/getting_started.html)
- [conda-forge py-pde package](https://anaconda.org/conda-forge/py-pde)

## Prepare SciClone

Log in to SciClone:

```bash
ssh wm_username@bora.sciclone.wm.edu
```

Replace `wm_username` with your W&M username.

Check whether conda is already available:

```bash
conda --version
```

If conda is not available, load the SciClone miniforge module:

```bash
module load miniforge3/24.9.2-0
```

## Create the Conda Environment

Create a fresh conda environment named `pde` and install `py-pde` from the `conda-forge` channel:

```bash
conda create -n pde -c conda-forge py-pde
```

Activate the environment:

```bash
conda activate pde
```

Install `ipykernel` so the environment can be used as a Jupyter notebook kernel:

```bash
conda install ipykernel
```

## Register a Jupyter Kernel

To use `py-pde` from the SciClone Jupyter notebook server, register the environment as a kernel:

```bash
python -m ipykernel install --user --name pde --display-name pde
```

After this step, a new Jupyter launcher named `pde` should appear.

## Configure the Kernel Path

SciClone Jupyter notebooks maintain their own environment, so you may need to set the kernel's `PATH` manually.

Edit the kernel configuration file:

```bash
/home/USERNAME/.local/share/jupyter/kernels/pde/kernel.json
```

Replace `USERNAME` with your SciClone username.

The file should include an `env` section that points to the conda environment's `bin` directory. For example:

```json
{
  "argv": [
    "/home/USERNAME/.conda/envs/pde/bin/python",
    "-Xfrozen_modules=off",
    "-m",
    "ipykernel_launcher",
    "-f",
    "{connection_file}"
  ],
  "env": {
    "PATH": "/home/USERNAME/.conda/envs/pde/bin:/usr/local/bin:/usr/bin:/bin"
  },
  "display_name": "pde",
  "language": "python",
  "metadata": {
    "debugger": true
  },
  "kernel_protocol_version": "5.5"
}
```

After saving `kernel.json`, restart the SciClone Jupyter server and open a notebook using the `pde` kernel.

## Test the Installation

Run a quick import test:

```bash
python -c "import pde; print(pde.__version__)"
```

You can also test a small diffusion solve:

```bash
python - <<'PY'
import pde

grid = pde.UnitGrid([16, 16])
state = pde.ScalarField.random_uniform(grid)
eq = pde.DiffusionPDE(diffusivity=0.1)
result = eq.solve(state, t_range=0.1, dt=0.01)

print(result.average)
PY
```

## Save the Environment

To record the packages you intentionally installed:

```bash
conda env export --from-history > pde-env.yml
```

This can be helpful when sharing a working setup with another student.
