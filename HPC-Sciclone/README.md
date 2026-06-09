# HPC Sciclone

This folder contains examples related to high-performance computing workflows on William & Mary's batch/slurm cluster (Sciclone), which is free to use for research and classroom projects.   

The top-level web page for information about Sciclone is [Research Computing at W&M](https://www.wm.edu/offices/it/services/researchcomputing/atwm/). The first step for students is to [request an account](https://www.wm.edu/offices/it/services/researchcomputing/acctreq/).


## Login on campus

### On campus

ssh gdsmit@bora.sciclone.wm.edu 
ssh -Y gdsmit@bora.sciclone.wm.edu

-Y if you want to use X11 

### Off campus 

ssh -Y -J gdsmit@bastion.wm.edu gdsmit@bora.sciclone.wm.edu

## Copying files 

### From bora to your computer

scp gdsmit@bora.sciclone.wm.edu:~/FILE .

scp -r gdsmit@bora.sciclone.wm.edu:~/DIRECTORY .

### Off campus 

scp -J gdsmit@bastion.wm.edu -r gdsmit@bora.sciclone.wm.edu:~/DIR .

### From your computer to bora

scp -J gdsmit@bastion.wm.edu -r gdsmit@bora.sciclone.wm.edu:~/cahn-hilliard/ .

## MATLAB 

salloc -t 180 

The -t flag gives time in minutes

module load matlab/R2024a 

matlab -nodesktop -r "do_flory_huggins_ternary_s_p_ps_q; exit"

## viewing files 

display file.png



## Login off campus

```
ssh -Y -J gdsmit@bastion.wm.edu gdsmit@bora.sciclone.wm.edu
```
-Y if you want to use X11 

### Bastion Host Instructions

[https://code.wm.edu/IT/bastion-host-instructions#-openssh-configuration](https://code.wm.edu/IT/bastion-host-instructions#-openssh-configuration)

#### Generating an SSH Key Pair 

On your computer:
```
ssh-keygen -t rsa
```

[https://wiki.osuosl.org/howtos/ssh_key_tutorial.html](https://wiki.osuosl.org/howtos/ssh_key_tutorial.html)

Visit the SSH Keys settings page to add your and paste your public key in the key field, give the key a suitable title, and click the add key button.

[https://code.wm.edu/-/user_settings/ssh_keys#index](https://code.wm.edu/-/user_settings/ssh_keys#index)

#### modify known_hosts file:
```
ssh-keygen -R bora.sciclone.wm.edu 
```
and, if needed
```
ssh-keygen -R 128.239.56.4
```

#### Working from home

```
ssh-keygen
ssh-copy-id gdsmit@bora.sciclone.wm.edu
ssh gdsmit@bora.sciclone.wm.edu
```

