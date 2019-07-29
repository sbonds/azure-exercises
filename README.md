# azure-exercises

Tests that particular exercises from Microsoft's documentation have been completed

Information needed:

* Azure subscription

Suggested order:

## Using Inspec with Azure

There's a really nice tour of Inspec at [http://www.anniehedgie.com/inspec-basics-1](http://www.anniehedgie.com/inspec-basics-1) and [Day 11](http://www.anniehedgie.com/inspec-basics-11) is about using it with Azure. While the whole series will be useful to know, if you just want to run these pre-canned tests, then the Day 11 information is all that's needed.

### "Service Principal" needed

This is a special form of authentication that may not be available to you if you are not the owner of the Azure account.

[How to set up a Service Principal](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal).

#### TODO: Run the Azure credentials check script and expect it to fail

This simply helps us understand what it is that we will be doing. When these checks pass, we're ready to go!

#### Log in via `az` tool

First, be sure it's installed via the [Install the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) instructions from Microsoft.

Open up a PowerShell window. You don't need to run as Administrator.

With Chrome open and the window corresponding to the Chrome profile for your Azure subscription on top, run `az login`. This should open a new tab in Chrome where you can log in using your Azure owner credentials.

Once logged in the "az login" command will return the following info:

```text
You have logged in. Now let us find all the subscriptions to which you have access...
[
  {
    "cloudName": "AzureCloud",
    "id": "99999999-0000-1111-2222-333333333333",
    "isDefault": true,
    "name": "Free Trial",
    "state": "Enabled",
    "tenantId": "12345678-1234-1234-1234-123123123123",
    "user": {
      "name": "email.address@domain.com",
      "type": "user"
    }
  }
]
```

The above info can be retrieved later if needed using `az account list`.

#### Create new Service Principal

```az
az ad sp create-for-rbac --name "InSpecReader" --role Reader --sdk-auth
```

**BE READY TO RECORD THE INFO IT RETURNS** as some of that info will not be available later (e.g. secret info.)

```text
Retrying role assignment creation: 1/36
Retrying role assignment creation: 2/36
{
  "clientId": "77777777-0000-1111-2222-333333333333",
  "clientSecret": "88888888-0000-1111-2222-333333333333",
  "subscriptionId": "99999999-0000-1111-2222-333333333333",
  "tenantId": "12345678-1234-1234-1234-123123123123",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

#### Configure Inspec for Service Principal

See the *Azure Platform Support in InSpec* section of [Inspect Patform support](https://www.inspec.io/docs/reference/platforms/) for details on setting this up.

By default, Chef InSpec authentication is configured in `~/.azure/credentials` which looks like:

```ini
[<subscriptionId>]
client_id = "<clientId>"
client_secret = "<clientSecret>"
tenant_id = "<tenantId>"
```

Using the values in the above example, we would have this in `~/.azure/credentials`:

```ini
[99999999-0000-1111-2222-333333333333]
client_id = "77777777-0000-1111-2222-333333333333"
client_secret = "88888888-0000-1111-2222-333333333333"
tenant_id = "12345678-1234-1234-1234-123123123123"
```

#### TODO: Run the Azure credentials check script again

## Create a new virtual network

[Microsoft: Quickstart: Create a virtual network using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-portal)
