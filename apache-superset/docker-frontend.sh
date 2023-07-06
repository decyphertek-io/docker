#!/usr/bin/env bash
# https://github.com/apache/superset/blob/master/docker/docker-frontend.sh

set -e

# Packages needed for puppeteer:
apt update
apt install -y chromium

cd /app/superset-frontend
npm install -f --no-optional --global webpack webpack-cli
npm install -f --no-optional

echo "Running frontend"
npm run dev
