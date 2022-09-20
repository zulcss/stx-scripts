#!/bin/bash
# setup an environment to be bootstrapped

ssh-keygen -f "/home/cshort/.ssh/known_hosts" -R "10.10.10.2"
ssh-copy-id sysadmin@10.10.10.2
scp -rp bootstrap sysadmin@10.10.10.2:.
