#!/bin/bash
set -euo pipefail

echo "Decrypting .env"
echo "$INPUT_GPG_KEY" > /tmp/private.key
gpg --allow-secret-key-import --import /tmp/private.key
shred -fu /tmp/private.key

gpg2 -K

echo "Workspace: $GITHUB_WORKSPACE"
pwd
ls $GITHUB_WORKSPACE
git config --global --add safe.directory $GITHUB_WORKSPACE
cd $GITHUB_WORKSPACE
git remote -v
git secret reveal

if [ -f ".env" ]; then
    cat .env | grep -E '^[^#]' | sed -E 's/^[^=#]+=(.*)/\1/g' | xargs -I {} echo "::add-mask::{}"
fi
