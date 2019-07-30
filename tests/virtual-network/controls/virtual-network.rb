# copyright: 2019, Steve Bonds

title "Check Virtual Network creation"

control 'resource_group' do
  describe azurerm_resource_groups.where(name: 'myResourceGroup') do
    it { should exist }
  end
end

control 'virtual_machines' do
  describe azurerm_virtual_machine(resource_group: 'myResourceGroup', name: 'myVm1') do
    it { should exist }
  end
  describe azurerm_virtual_machine(resource_group: 'myResourceGroup', name: 'myVm2') do
    it { should exist }
  end
end

