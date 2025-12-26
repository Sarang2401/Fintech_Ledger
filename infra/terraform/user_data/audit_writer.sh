#!/bin/bash
set -e

yum update -y
yum install -y python3 git

pip3 install kafka-python requests

mkdir -p /opt/audit-writer
chown ec2-user:ec2-user /opt/audit-writer
