#!/bin/bash
set -e

echo "=== Update system ==="
apt update && apt upgrade -y

echo "=== Install curl ==="
apt install -y curl wget ca-certificates gnupg lsb-release uidmap

echo "=== Install OpenSSH ==="
apt install -y openssh-server

echo "=== Enable SSH ==="
systemctl enable ssh
systemctl restart ssh

echo "=== Enable root login + password auth ==="

mkdir -p /etc/ssh/sshd_config.d

cat > /etc/ssh/sshd_config.d/99-custom.conf <<EOF
PermitRootLogin yes
PasswordAuthentication yes
PubkeyAuthentication yes
EOF

sshd -t
systemctl restart ssh


echo "=== Install Docker ==="
curl -fsSL https://get.docker.com | sh
#dockerd-rootless-setuptool.sh install

systemctl enable docker
systemctl start docker

echo "=== Install NVM ==="
export NVM_VERSION="v0.40.5"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash


echo ""
echo "==================================="
echo "DONE"
echo "==================================="
echo ""