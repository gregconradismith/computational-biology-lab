# HPC SciClone

This folder contains examples for high-performance computing workflows on William & Mary's SciClone cluster. SciClone is W&M's research computing environment and is available for research and classroom projects.

Start with the W&M Research Computing pages:

- [Research Computing at W&M](https://www.wm.edu/offices/it/services/researchcomputing/atwm/)
- [Request a SciClone account](https://www.wm.edu/offices/it/services/researchcomputing/acctreq/)
- [Bastion host instructions](https://code.wm.edu/IT/bastion-host-instructions#-openssh-configuration)

## Specialized Workflows

The following subdirectories contain project-specific SciClone setup notes:

- [FEniCSx and DOLFINx on SciClone Jupyter](Fenicsx-Dolfinx/README.md): create a DOLFINx conda environment and register it as a SciClone Jupyter kernel
- [MOOSE on SciClone Jupyter](Moose/README.md): install the MOOSE Framework with conda, build and test MOOSE, and create a starter MOOSE application
- [py-pde on SciClone](PY-PDE/README.md): create a conda environment for finite-difference PDE simulations and register it as a SciClone Jupyter kernel

In the examples below, replace `wm_username` with your W&M username.

## Logging In

### On Campus

Use SSH to connect to the `bora` login node:

```bash
ssh wm_username@bora.sciclone.wm.edu
```

If you need X11 forwarding for graphical programs, add `-Y`:

```bash
ssh -Y wm_username@bora.sciclone.wm.edu
```

### Off Campus

When working off campus, connect through the W&M bastion host:

```bash
ssh -Y -J wm_username@bastion.wm.edu wm_username@bora.sciclone.wm.edu
```

The `-J` option tells SSH to jump through the bastion host. The `-Y` option enables trusted X11 forwarding and is only needed if you plan to open graphical windows.

## Copying Files

Use `scp` to copy files between your computer and SciClone.

### From SciClone to Your Computer

Copy one file from your home directory on `bora` to the current directory on your computer:

```bash
scp wm_username@bora.sciclone.wm.edu:~/FILE .
```

Copy a directory recursively:

```bash
scp -r wm_username@bora.sciclone.wm.edu:~/DIRECTORY .
```

From off campus, add the bastion host:

```bash
scp -J wm_username@bastion.wm.edu -r wm_username@bora.sciclone.wm.edu:~/DIRECTORY .
```

### From Your Computer to SciClone

Copy a local directory to your home directory on `bora`:

```bash
scp -r DIRECTORY wm_username@bora.sciclone.wm.edu:~/
```

From off campus, add the bastion host:

```bash
scp -J wm_username@bastion.wm.edu -r DIRECTORY wm_username@bora.sciclone.wm.edu:~/
```

## MATLAB on SciClone

Request an interactive allocation before running MATLAB:

```bash
salloc -t 180
```

The `-t` flag requests time in minutes. For example, `-t 180` requests three hours.

Load MATLAB:

```bash
module load matlab/R2024a
```

Run MATLAB without the desktop interface:

```bash
matlab -nodesktop
```

Run a MATLAB script and then exit:

```bash
matlab -nodesktop -r "do_flory_huggins_ternary_s_p_ps_q; exit"
```

## Viewing Image Files

If you logged in with X11 forwarding, you can view an image file from the command line:

```bash
display file.png
```

## SSH Keys

SSH keys allow you to log in without typing your password every time.

Generate a key pair on your computer:

```bash
ssh-keygen -t ed25519
```

Then add your public key to your W&M GitLab account:

- [W&M GitLab SSH key settings](https://code.wm.edu/-/user_settings/ssh_keys#index)
- [SSH key tutorial](https://wiki.osuosl.org/howtos/ssh_key_tutorial.html)

## Known Hosts Cleanup

If SSH warns that the host key for `bora.sciclone.wm.edu` has changed, remove the old entry from your `known_hosts` file:

```bash
ssh-keygen -R bora.sciclone.wm.edu
```

If needed, also remove the old IP address entry:

```bash
ssh-keygen -R 128.239.56.4
```

Then try connecting again.

## First-Time SSH Key Setup

After creating an SSH key, you may be able to copy it to SciClone directly when you are on campus:

```bash
ssh-copy-id wm_username@bora.sciclone.wm.edu
```

From off campus, copy the key through the bastion host:

```bash
ssh-copy-id -o ProxyJump=wm_username@bastion.wm.edu wm_username@bora.sciclone.wm.edu
```

Then test your login. On campus:

```bash
ssh wm_username@bora.sciclone.wm.edu
```

Off campus:

```bash
ssh -J wm_username@bastion.wm.edu wm_username@bora.sciclone.wm.edu
```
