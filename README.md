# PCBC Teaching AMI
[Packer](https://packer.io/) build scripts for the AMI used at PCBC training courses.

Specifically, this branch is for the training session in Seattle, 2016.

To build:

Clone and switch to the `Seattle2016` branch:

```
git clone https://github.com/Sage-Bionetworks/PCBC_AMI.git
cd PCBC_AMI
git checkout Seattle2016
```

Then:

```
packer build pcbc.json
```

Building means a base AMI is started as an EC2 instance, each provisioner script is run on that remote EC2 instance, and the resulting state is saved as a new AMI.

To administer as root, use key file and login as `ubuntu` user, then `sudo -i` to get root shell.
