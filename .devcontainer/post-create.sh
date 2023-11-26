#!/usr/bin/env sh

echo 'source /usr/share/bash-completion/completions/git' >> ~/.bashrc

apt update

apt install -y build-essential gh

npm install -g npm@latest
