#!/bin/bash
set -euo pipefail

echo "Decrypting .env"
echo "$INPUT_GPG_KEY" | sed -E 's/\\n/\n/g' > /tmp/private.key
gpg --allow-secret-key-import --import /tmp/private.key
shred -fu /tmp/private.key

gpg2 -K

echo "Workspace: $GITHUB_WORKSPACE"
git config --global --add safe.directory $GITHUB_WORKSPACE

pkill -9 gpg-agent
export GPG_TTY=/dev/console
git secret reveal -f -v

if [ -f ".env" ]; then
    cat .env | grep -E '^[^#]' | sed -E 's/^[^=#]+=(.*)/\1/g' | xargs -I {} echo "::add-mask::{}"
fi
