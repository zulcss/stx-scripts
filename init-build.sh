#!/bin/bash
# Prep everything ready to be built

git config --global user.name "Charles Short"
git config --global user.email charles.short@windriver.com
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y less vim

BUILD_BRANCH=master
MANIFEST="default.xml"
cd $MY_REPO_ROOT_DIR
repo init -u https://opendev.org/starlingx/manifest -b $BUILD_BRANCH -m ${MANIFEST}
repo sync

#pushd $MY_REPO
# regen script
# https://review.opendev.org/c/starlingx/root/+/816992
#git fetch https://review.opendev.org/starlingx/root refs/changes/92/816992/22 && git cherry-pick FETCH_HEAD
#popd

downloader -s -b
