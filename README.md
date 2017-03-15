# DC/OS using tf

Terraform way to dcos

## Usage
the dammi_ami.sh script will give you the right CoreOS AWS ami for the specific region -> 

Usage: dammi_ami.sh <region-here> i.e. dammi_ami.sh eu-west-1

## variable.tf
All the setting for the cluster: name, nodes, ami, region, and so no

## security stuff
- use aws configure to setup your credential
- cp terraform.tfvars.sample terraform.tfvars to change security setting.


## Output
At the end on the apply you'll get zk exhibitor/dcos urls
