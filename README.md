# PCBC Teaching AMI
[Packer](https://packer.io/) build scripts for the AMI used at PCBC Training.

Specifically, this branch is for the training session in Bozeman, 2015.

To build:

```
packer build pcbc.json
```

Has a manual finishing step to make a pretty graphical panel to launch the installed apps (for RStudio, PathVisio, Cytoscape, and AltAnalyze).
