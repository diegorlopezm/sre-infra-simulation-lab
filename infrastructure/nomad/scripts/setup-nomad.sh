#!/bin/bash
# Script para instalar Nomad en un VPS limpio
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install -y nomad

sudo mkdir -p /opt/nomad/data
sudo cp infrastructure/nomad/nomad.hcl /etc/nomad.d/