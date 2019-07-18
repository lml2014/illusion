#!/bin/bash
set -ev

# get clone
git clone https://${GH_REF} .deploy_git
cd .deploy_git
git checkout gh-pages

cd ../
mv .deploy_git/.git/ ./public/

cd ./public

git config user.name "lml2014"
git config user.email "982905676@qq.com"

# add commit timestamp
git add .
git commit -m "Auto Update Time at `date +"%Y-%m-%d %H:%M"`"

# Github Pages
git push --force --quiet "https://${github_token}@${GH_REF}" gh-pages:gh-pages