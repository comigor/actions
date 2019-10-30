#!/bin/sh
set -eu

cd "$GITHUB_WORKSPACE"

echo "Downloading dependencies"
pub get

scopes=${PUB_SCOPES:-[\"https://www.googleapis.com/auth/plus.me\",\"https://www.googleapis.com/auth/userinfo.email\"]}

echo "Update Pub token from secret"
echo "{\"accessToken\":\"$PUB_ACCESS_TOKEN\",\"refreshToken\":\"$PUB_REFRESH_TOKEN\",\"tokenEndpoint\":\"https://accounts.google.com/o/oauth2/token\",\"scopes\":$scopes,\"expiration\":$PUB_EXPIRATION}" > ~/.pub-cache/credentials.json

echo "Publish"
echo y | pub publish
