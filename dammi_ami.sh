#!/bin/bash

build=stable      # define build ["stable", "beta", "alpha"]
disk=hvm         # define disk backing ["pv", "hvm"]

if [ "x$1" = "x" ]; then
    echo "Usage: $0 REGION"; exit 1
fi

#### deprecated
#ami_id=$(curl --silent http://$build.release.core-os.net/amd64-usr/current/coreos_production_ami_all.json | grep -A 2 $1 | grep $disk | cut -d"\"" -f4)

#### Source from coreos.com now (h/t cswong)
ami_id=$(curl --silent https://coreos.com/dist/aws/aws-$build.json | grep -A 2 "$1" | grep $disk | cut -d"\"" -f4)

[ -z "$ami_id" ] && echo "FAIL: region $1 not found or doesn't include a CoreOS $build, $disk backed AMI" && exit 1

echo -n "$1,$build,$disk,$ami_id,"
echo "https://console.aws.amazon.com/ec2/home?region=$1#launchAmi=$ami_id"

exit 0
