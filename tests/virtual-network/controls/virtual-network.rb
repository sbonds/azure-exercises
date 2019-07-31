# copyright: 2019, Steve Bonds

title "Check Virtual Network creation"

control 'resource_group' do
  describe azurerm_resource_groups.where(name: 'myResourceGroup') do
    it { should exist }
  end
end

control 'virtual_network' do
  describe azurerm_virtual_network(resource_group: 'myResourceGroup', name: 'myVirtualNetwork') do
    it { should exist }
    its('subnets') { should eq ['default'] }
  end
end

# TODO: Check that the virtual machines' NICs are in the above Virtual Network
control 'virtual_machines' do
  describe azurerm_virtual_machine(resource_group: 'myResourceGroup', name: 'myVm1') do
    it { should exist }
  end
  describe azurerm_virtual_machine(resource_group: 'myResourceGroup', name: 'myVm2') do
    it { should exist }
  end
end
