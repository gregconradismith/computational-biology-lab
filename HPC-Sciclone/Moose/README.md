# MOOSE on SciClone Jupyter

This directory contains notes for installing and using the [MOOSE Framework](https://mooseframework.inl.gov/) on W&M's SciClone system.

MOOSE is a multiphysics simulation framework developed at Idaho National Laboratory. These notes focus on creating a conda-based MOOSE development environment on SciClone and testing it from the command line.

## Resources

- [MOOSE Framework](https://mooseframework.inl.gov/)
- [MOOSE installation guide](https://mooseframework.inl.gov/getting_started/installation/index.html)
- [MOOSE conda installation instructions](https://mooseframework.inl.gov/getting_started/installation/conda.html)

## Included Materials

- [moose\_cahn\_hilliard\_discussion.pdf](moose_cahn_hilliard_discussion.pdf): discussion notes related to a MOOSE Cahn-Hilliard example

## Prepare the SciClone Environment

Log in to the `bora` login node:

```bash
ssh wm_username@bora.sciclone.wm.edu
```

Make sure you are running a Bash shell:

```bash
echo $0
```

You should see something like:

```text
-bash
```

Check the loaded modules:

```bash
module list
```

If `miniforge` is not loaded, load it:

```bash
module load miniforge3/24.9.2-0
```

Then check the modules again:

```bash
module list
```

If you use MOOSE regularly, consider adding the `module load miniforge3/24.9.2-0` command to your `.bashrc.bora` file.

## Create the MOOSE Conda Environment

Add the INL conda channel:

```bash
conda config --add channels https://conda.software.inl.gov/public
```

Create and activate the MOOSE environment:

```bash
conda create -n moose moose-dev=2026.05.08=mpich
conda activate moose
```

## Clone and Build MOOSE

Create a projects directory and clone MOOSE:

```bash
mkdir -p ~/projects
cd ~/projects
git clone https://github.com/idaholab/moose.git
cd moose
git checkout master
```

Build the MOOSE test application:

```bash
cd ~/projects/moose/test
make -j 6
```

Run the MOOSE tests:

```bash
./run_tests -j 6
```

## Create a MOOSE Application

Use the MOOSE `stork.sh` helper to create a new application:

```bash
cd ~/projects
./moose/scripts/stork.sh your_app_name
```

Build and test the new application:

```bash
cd ~/projects/your_app_name
make -j 6
./run_tests -j 6
```

Replace `your_app_name` with the name of your project.

## ParaView on Mac

ParaView is useful for visualizing simulation output.

Related build documentation:

- [ParaView build documentation](https://gitlab.kitware.com/paraview/paraview/-/blob/master/Documentation/dev/build.md)

Install dependencies with Homebrew:

```bash
brew install open-mpi cmake mesa tbb ninja gdal qt5
```

Install the ParaView app:

```bash
brew install --cask paraview
```
