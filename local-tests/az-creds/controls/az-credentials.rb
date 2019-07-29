# copyright: 2019, Steve Bonds

title "Check Azure local credentials"

# Checks on the credentials file
# TODO: $HOME doesn't work either
# http://www.anniehedgie.com/inspec-basics-10 suggests creating a Rakefile and using template processing to substitute
# environment variables (e.g. $HOME) into Inspec attribiutes. Seems painful for a tool that's supposed to make things
# easier.
describe file("~/.azure/credentials") do
  it { should exist }
end
