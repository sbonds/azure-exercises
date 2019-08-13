# Suggested Order

## Why use Azure Portal examples

This helps prevent copy-paste without understanding what is being asked. Under actual use, a much better approach is creating an appropriate script or template, putting it in version control, testing it, and only then using for the desired work.

Perhaps a future iteration of these examples will include CLI-based instructions but will request specific customizations vs. the Microsoft examples to prevent copy-paste without understanding.

## Fundamental Tutorial 1: Create / manage a VM

[Tutorial: Create and Manage Windows VMs with Azure PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-manage-vm)

## Fundamental Tutorial 6: Create a scale set

[Tutorial: Create a virtual machine scale set and deploy a highly available app on Windows with Azure PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-create-vmss)

## Fundamental Tutorial 7: Load balancing

[Tutorial: Load balance Windows virtual machines in Azure to create a highly available application with Azure PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-load-balancer)

## Fundamental Tutorial 11: Monitor and update VMs

[Tutorial: Monitor and update a Windows virtual machine in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-monitoring)

## Architecture Fundamentals Group 1: Setting up a virtual network with several load balanced Windows virtual machines

### Run the Group 1 "red" test

TODO: build this test

### [Create a Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/)

[Microsoft: Quickstart: Create a virtual network using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-portal)

### [Create a Windows Virtual Machine](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/)

#### Create the Windows VMs

[Quickstart: Create a Windows virtual machine in the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-portal)

#### Add an additional virtual hard disk to each VM

[Attach a managed data disk to a Windows VM by using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/attach-managed-disk-portal)

#### Add an additional NIC to each VM

[Create and manage a Windows virtual machine that has multiple NICs](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/multiple-nics)

#### Open up the TCP network ports the business application uses

This example uses the very common port of 80 for HTTP-provided services. (HTTPS uses port 443 and is not part of this exercise.)

[How to open ports to a virtual machine with the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/nsg-quickstart-portal)

### Create a virtual machine scale set

[Quickstart: Create a virtual machine scale set in the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/quick-create-portal)

### [Create a Load Balancer](https://docs.microsoft.com/en-us/azure/load-balancer/)

[Quickstart: Create a Basic Load Balancer by using the Azure portal](https://docs.microsoft.com/en-us/azure/load-balancer/quickstart-create-basic-load-balancer-portal)

### Enable boot diagnostics on all VMs

[How to use boot diagnostics to troubleshoot virtual machines in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/troubleshooting/boot-diagnostics)

### Enable Host VM metrics

TODO: find a good Microsoft quickstart or walkthrough

### Install Windows guest OS diagnostics extension

TODO: find a good Microsoft quickstart or walkthrough

### Set up low disk space alert

TODO: find a good Microsoft quickstart or walkthrough

### Set up Windows Updates

TODO: find a good Microsoft quickstart or walkthrough

### Schedule automatic updates

TODO: find a good Microsoft quickstart or walkthrough

### Run the Group 1 "green" test

## Architecture Fundamentals Group 2: Create a storage account with a content delivery network

## Architecture Fundamentals Group 3: Create and use file shares

## Architecture Fundamentals Group 4: Setting up and using Azure backup and restore

## Architecture Fundamentals Group 5: Using Azure subscriptions and monitoring resources

## Architecture Fundamentals Group 6: More complex virtual networks

## Architecture Fundamentals Group 7: Working with Azure Active Directory
