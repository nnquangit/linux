#!/bin/bash
set -e

echo "=== Install Docker ==="
curl -fsSL https://get.docker.com | sh

systemctl enable docker
systemctl start docker

dockerd-rootless-setuptool.sh install
