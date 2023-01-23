////////////////////
// Resource group
////////////////////
resource "azurerm_resource_group" "this" {
  name     = "rg-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location = var.location
}

////////////////////
// Network watcher
////////////////////
resource "azurerm_network_watcher" "this" {
  name                = "netw-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  depends_on = [azurerm_resource_group.this]
}

////////////////////
// Virtual network
////////////////////
resource "azurerm_virtual_network" "this" {
  name                = "net-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = var.net_address_space

  depends_on = [azurerm_resource_group.this, azurerm_network_watcher.this]
}

////////////////////
// Subnet
////////////////////
resource "azurerm_subnet" "this" {
  count = var.subnet_count

  name                 = "subnet-${var.subnet_types[count.index]}-${var.workload}-${var.environment}-${var.location}-00${count.index}"
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = azurerm_resource_group.this.name
  address_prefixes     = ["${var.subnet_address_prefixes[count.index]}"]

  depends_on = [azurerm_virtual_network.this]
}

//////////////////////////
// The public ip
//////////////////////////
resource "azurerm_public_ip" "this" {
  count = var.subnet_count

  name                = "publicip-${var.subnet_types[count.index]}-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Dynamic"
}

//////////////////////////
// The network interface
//////////////////////////
resource "azurerm_network_interface" "this" {
  count = var.subnet_count

  name                = "interface-${var.subnet_types[count.index]}-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal${count.index}"
    subnet_id                     = azurerm_subnet.this[count.index].id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.this[count.index].id
  }
}

//////////////////////////
// The virtual machine
//////////////////////////
resource "azurerm_linux_virtual_machine" "this" {
  count = var.subnet_count

  name                = "virtpc-${var.subnet_types[count.index]}-${var.workload}-${var.environment}-${var.location}-${var.instance}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  size           = "Standard_B1ls" #"Standard B1ls (1 vcpu, 0.5 GiB memory)"
  admin_username = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.this[count.index].id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
