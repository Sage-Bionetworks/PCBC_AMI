# PCBC Teaching AMI
[Packer](https://packer.io/) build scripts for the AMI used at PCBC Training.

Specifically, this branch is for the training session in Bozeman, 2015.

To build:

```
packer build pcbc.json
```

Has a manual finishing step to make a pretty graphical panel to launch the installed apps (for RStudio, PathVisio, Cytoscape, and AltAnalyze). Start an instance of the AMI created in the last step and add the following commands to the panel as launchers:

1. AltAnalyze - `python /opt/altanalyze/AltAnalyze.py`, working directory `/opt/altanalyze/`, icon `/opt/altanalyze/Config/icon.gif`
1. RStudio - just add RStudio from add to panel menu
1. Cytoscape - `/bin/sh "/opt/Cytoscape_v3.2.1/Cytoscape"`
1. PathVisio - `java -jar pathvisio.jar /opt/pathvisio-3.2.0/pathvisio.jar "$@"`, working directory `/opt/pathvisio-3.2.0/`, icon `/opt/pathvisio-3.2.0/pathvisio-eye-switch-e1363105300175.png`

