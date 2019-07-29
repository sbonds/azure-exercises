# azure-exercises

Tests that particular exercises from Microsoft's documentation have been completed

Information needed:

* Azure subscription

Suggested order:

## Using Inspect with Azure

There's a really nice tour of Inspec at [http://www.anniehedgie.com/inspec-basics-1](http://www.anniehedgie.com/inspec-basics-1) and [Day 11](http://www.anniehedgie.com/inspec-basics-11) is about using it with Azure. While the whole series will be useful to know, if you just want to run these pre-canned tests, then the Day 11 information is all that's needed.

### "Service Principal" needed

This is a special form of authentication that may not be available to you if you are not the owner of the Azure account.

[How to set up a Service Principal](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal).

TODO: Make an `az` CLI script that creates one for us and returns (or creates) the necessary information for it to work. Of course, make an Inspec profile to check that this has been done before writing that script.

See the *Azure Platform Support in InSpec* section of [Inspect Patform support](https://www.inspec.io/docs/reference/platforms/) for details on setting this up.

By default, Chef InSpec authentication is configured in `~/.azure/credentials` which looks like:

```ini
[<SUBSCRIPTION_ID>]
client_id = "<application ID>"
client_secret = "<key/password>"
tenant_id = "<directory ID>"
```

Microsoft keeps changing the names of things, which is why there's a mismatch. They may change again.

## Create a new virtual network

[Microsoft: Quickstart: Create a virtual network using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-portal)
