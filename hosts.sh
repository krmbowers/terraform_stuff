#!/bin/sh

vmss_ip=$(terraform output vm_ip)
echo $vmss_ip
echo "host1 ansible_ssh_port=50001 ansible_ssh_host="$vmss_ip> inventory
