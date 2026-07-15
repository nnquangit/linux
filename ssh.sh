#!/bin/bash
set -e

echo "=== Update system ==="
apt update && apt upgrade -y

echo "=== Install curl ==="
apt install -y curl wget ca-certificates gnupg lsb-release

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
