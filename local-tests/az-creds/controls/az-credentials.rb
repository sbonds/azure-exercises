# copyright: 2019, Steve Bonds

title "Check Azure local credentials"

# Checks on the credentials file
describe file("#{ENV['HOME']}/.azure/credentials") do
  it { should exist }
end
