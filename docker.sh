#!/bin/bash
set -e

echo "=== Update system ==="
apt update && apt upgrade -y

echo "=== Install curl ==="
apt install -y curl wget ca-certificates gnupg lsb-release uidmap

echo "=== Install Docker ==="
curl -fsSL https://get.docker.com | sh

systemctl enable docker
systemctl start docker

dockerd-rootless-setuptool.sh install
