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

#### Run the Azure credentials check script and expect it to fail

This simply helps us understand what it is that we will be doing. When these checks pass, we're ready to go!

Via Bash or Git client:

```bash
git clone https://github.com/sbonds/azure-exercises.git
cd azure-exercises/local-tests
export SUBSCRIPTION_ID=<your Azure subscription ID>
inspec exec az-creds
```

Or via PowerShell:

```powershell
git clone https://github.com/sbonds/azure-exercises.git
cd azure-exercises/local-tests
$Env:SUBSCRIPTION_ID=<your Azure subscription ID>
inspec exec az-creds
```

At this point, a failure like the following is expected. If you get odd errors that differ from this, there may be something else wrong:

```output
$ inspec exec az-creds
#< CLIXML

Profile: Check local Azure Credentials (az-creds)
Version: 0.1.0
Target:  local://

  File C:\Users\testuser/.azure/credentials
     [FAIL]  should exist
     expected File C:\Users\testuser/.azure/credentials to exist
     [FAIL]  content should match /99999999-0000-1111-2222-333333333333/
     expected nil to match /99999999-0000-1111-2222-333333333333/
  INI C:\Users\testuser/.azure/credentials
     [SKIP]  Can't find file: C:\Users\testuser/.azure/credentials

Test Summary: 0 successful, 2 failures, 1 skipped
```

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
client_id = <clientId>
client_secret = <clientSecret>
tenant_id = <tenantId>
```

Using the values in the above example, we would have this in `~/.azure/credentials`:

```ini
[99999999-0000-1111-2222-333333333333]
client_id = 77777777-0000-1111-2222-333333333333
client_secret = 88888888-0000-1111-2222-333333333333
tenant_id = 12345678-1234-1234-1234-123123123123
```

#### Run the Azure credentials check script again

```bash
cd azure-exercises/local-tests
export SUBSCRIPTION_ID=<your Azure subscription ID>
inspec exec az-creds
```

Or via PowerShell:

```powershell
cd azure-exercises/local-tests
$Env:SUBSCRIPTION_ID=<your Azure subscription ID>
inspec exec az-creds
```

The tests should all pass and not be skipped this time:

```output
Test Summary: 5 successful, 0 failures, 0 skipped
```

## Create a new virtual network

[Microsoft: Quickstart: Create a virtual network using the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-network/quick-create-portal)

When you think it's completed run:

```bash
cd azure-exercises/tests
export SUBSCRIPTION_ID=<your Azure subscription ID>
inspec exec virtual-network -t azure://$SUBSCRIPTION_ID
```

Or via PowerShell:

```powershell
cd azure-exercises/tests
$Env:SUBSCRIPTION_ID=<your Azure subscription ID>
inspec exec virtual-network -t azure://$SUBSCRIPTION_ID
```

```output
  [PASS]  resource_group: Resource Groups with name == "myResourceGroup"
     [PASS]  Resource Groups with name == "myResourceGroup" should exist
  [PASS]  virtual_machines: 'myVm1' Virtual Machine
     [PASS]  'myVm1' Virtual Machine should exist
     [PASS]  'myVm2' Virtual Machine should exist
```

Later on I'll just give you the name of the inspec test so filling in the `-t azure://$SUBSCRIPTION_ID` with the right ID will be up to you.
