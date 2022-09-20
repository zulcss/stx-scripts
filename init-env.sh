#!/bin/bash
# Reset the environment to be build again

sudo rm -rf /localhost/*
sudo rm -rf  $TOOL_HOME
mkdir -p $TOOL_HOME
cd $TOOL_HOME
git clone https://opendev.org/starlingx/tools

mkdir -p $WORKSPACE_HOME
sudo mkdir -p $STX_BUILD_HOME
sudo chown -R cshort $STX_BUILD_HOME
ln -sf $WORKSPACE_HOME $STX_BUILD_HOME

source ./import-stx

# Align the builder container to use your user/UID
stx config --add builder.myuname $(id -un)
stx config --add builder.uid $(id -u)

# Embedded in ~/localrc of the build container
stx config --add project.gituser "Chuck Short"
stx config --add project.gitemail "charles.short@windriver.com"

# This will be included in the name of your build container and the basename for $MY_REPO_ROOT_DIR
stx config --add project.name $PROJECT
stx config --add project.proxy false

# Show all the settings
stx config --show
