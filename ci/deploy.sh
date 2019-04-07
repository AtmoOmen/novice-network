#!/bin/bash
openssl aes-256-cbc -K $encrypted_74088940e92b_key -iv $encrypted_74088940e92b_iv -in ci/deploy-key.enc -out ci/deploy-key -d
chmod 700 ci
chmod 600 ci/deploy-key
eval `ssh-agent -s`
ssh-add ci/deploy-key
git config user.name "bot"
git config user.email "root@localhost"
git -C dist init
git -C dist remote add origin git@github.com:thewakingsands/novice-network-pages.git
git -C dist add -A
git -C dist commit -m "Auto deploy by Travis CI"
git -C dist push -f origin master
