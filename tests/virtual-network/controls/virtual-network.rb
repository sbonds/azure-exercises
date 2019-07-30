# copyright: 2019, Steve Bonds

title "Check Virtual Network creation"

control 'resource_group' do
  describe azurerm_resource_groups.where(name: 'myResourceGroup') do
    it { should exist }
  end
end

