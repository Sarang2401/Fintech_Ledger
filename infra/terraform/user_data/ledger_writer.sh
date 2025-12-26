#!/bin/bash
set -e

yum update -y
yum install -y python3 git

pip3 install kafka-python psycopg2-binary

mkdir -p /opt/ledger-writer
chown ec2-user:ec2-user /opt/ledger-writer
