#!/bin/bash

sudo bash /usr/share/debian-integration/after_bootstrap_workarounds.sh

source /etc/platform/openrc
OAM_IF=enp2s1
system host-if-modify controller-0 $OAM_IF -c platform
system interface-network-assign controller-0 $OAM_IF oam

system storage-backend-add ceph --confirmed

system host-disk-list controller-0
system host-disk-list controller-0 | awk '/\/dev\/sdb/{print $2}' | xargs -i system host-stor-add controller-0 {}
system host-stor-list controller-0

system host-unlock controller-0
