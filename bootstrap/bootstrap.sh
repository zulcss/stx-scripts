#!/bin/bash

#sudo ostree admin unlock --hotfix
#sudo apt-get update && sudo apt-get dist-upgrade -y
#sudo cp postgresql.pp /usr/share/puppet/modules/platform/manifests
#cp cumulus-docker-registry-ca-cert.pem /home/sysadmin
cd ~
cat <<EOF > localhost.yml
system_mode: simplex

dns_servers:
- 128.224.144.130
- 147.11.57.128
- 147.11.57.133

external_oam_subnet: 10.10.10.0/24
external_oam_gateway_address: 10.10.10.1
external_oam_floating_address: 10.10.10.2
external_oam_node_0_address: 10.10.10.4
external_oam_node_1_address: 10.10.10.5
management_start_address: 192.168.204.1
management_subnet: 192.168.204.0/24

admin_username: admin
admin_password: Li69nux!
ansible_become_pass: Li69nux!

# Add these lines to configure Docker to use a proxy server
# docker_http_proxy: http://my.proxy.com:1080
# docker_https_proxy: https://my.proxy.com:1443
# docker_no_proxy:
#   - 1.2.3.4

EOF
sudo bash /usr/share/debian-integration/before_bootstrap_workarounds.sh
ansible-playbook -vvv /usr/share/ansible/stx-ansible/playbooks/bootstrap.yml 

