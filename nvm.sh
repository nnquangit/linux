#!/bin/bash
set -e

echo "=== Install NVM ==="
export NVM_VERSION="v0.40.5"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash
