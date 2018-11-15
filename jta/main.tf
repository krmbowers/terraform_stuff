module "mycompute" {
  source = "Azure/compute/azurerm"
  resource_group_name = "${var.rg}"
  location = "${var.location}"
  remote_port = "22"
  vm_os_publisher = "Canonical"
  vm_os_offer = "UbuntuServer"
  vm_os_sku = "16.04-LTS"
  vm_os_simple = "UbuntuServer"
  nb_instances = 3
  public_ip_dns = ["table2kbapp"]
  vnet_subnet_id = "${module.network.vnet_subnets[0]}"
  tags = {
    environment = "testing"
}


module "network" {
  source="Azure/network/azurerm"
  location="${var.location}"
  resource_group_name="${var.rg}"
}

output "vm_public_name"{
  value="${module.mycompute.public_ip_dns_name}"
}

output "vm_public_ip"{
  value="${module.mycompute.public_ip_address}"
}

output "vm_private_ips" {
  value="${module.mycompute.network_interface_private_ip}"
}
