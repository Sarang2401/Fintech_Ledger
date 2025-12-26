#!/bin/bash
set -e

yum update -y
yum install -y python3 git

pip3 install flask kafka-python

mkdir -p /opt/payment-api
chown ec2-user:ec2-user /opt/payment-api
