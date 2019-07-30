# copyright: 2019, Steve Bonds

title "Check Virtual Network creation"

control 'resource_group' do
  describe azurerm_resource_groups do
    its('names') { should include 'myResourceGroup' }
  end
end

