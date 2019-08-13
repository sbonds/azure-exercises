# copyright: 2019, Steve Bonds

title "Check Azure local credentials"

if ENV['SUBSCRIPTION_ID'].nil?
  abort("Please set your 'SUBSCRIPTION_ID=<subscription ID>' environment variable before using this check")
end

# Checks on the credentials file
describe file("#{ENV['HOME']}/.azure/credentials") do
  it { should exist }
  its('content') { should match (%r{#{ENV['SUBSCRIPTION_ID']}}) }
end

# This credentials file is Windows INI style, check some details like correct
# numbers of digits in the various IDs from Azure
describe ini("#{ENV['HOME']}/.azure/credentials") do
  its("#{ENV['SUBSCRIPTION_ID']}.client_id") { should match /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/ }
  its("#{ENV['SUBSCRIPTION_ID']}.client_secret") { should match /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/ }
  its("#{ENV['SUBSCRIPTION_ID']}.tenant_id") { should match /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/ }
end