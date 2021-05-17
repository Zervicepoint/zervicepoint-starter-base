# zervicepoint-starter-base

Starter template for Zervicepoint plugin using PowerShell. The intent of this project is to help scaffolding a new Zervicepoint plugin quickly.

If you're unfamiliar with [activities](https://docs.zervicepoint.com/reference/activity) or [data sources](https://docs.zervicepoint.com/tutorials/data-source/) please check our [docs](https://docs.zervicepoint.com) site.

## Requirements

This requires the PowerShell module [Plaster](https://github.com/PowerShellOrg/Plaster).

*What is plaster?*

Plaster is a template-based file and project generator written in PowerShell. Its purpose is to streamline the creation of PowerShell module projects, Pester tests, DSC configurations, and more. File generation is performed using crafted templates which allow the user to fill in details and choose from options to get their desired output.

## Getting started

This guide assumes that the following is done on the [Zervicepoint Worker](https://docs.zervicepoint.com/onboarding/cloud-onboarding-worker-plan/).

```powershell
Find-Module -Name Plaster | Install-Module
```

Clone this project to a local folder.

```powershell
git clone https://github.com/zervicepoint/zervicepoint-starter-base.git
```

Run Invoke-Plaster to setup a new project based on a template.

```powershell
# -TemplatePath must point to the location of the cloned project.
Invoke-Plaster -TemplatePath .\zervicepoint-starter-base -DestinationPath "C:\Program Files\Zipper\Zervicepoint\Provider extensions\"
```

Invoke-Plaster will prompt for the following details:

* Enter **name** of plugin *Set Activity,Table,WebService and Shared module suffix/prefix names*
* Enter the **version** number of this plugin *Set version number in PowerShell manifest*
* Enter the **author** of this plugin *Set author property in PowerShell manifest*
* Enter the **company** *Set Company and Copyright property in PowerShell manifest*

It will then scaffold a plugin in the *Provider extensions* folder of Zervicepoint.

![Output](images/invoke-plaster-sample.PNG)

## Next steps

1. Copy the **pluginname**.clientwebservice.providers.xml and **pluginname**.provisioningsystem.providers.xml to the ClientWebService and ProvisioningSystem folder of the ZP Worker.
2. Restart ProvisioningSystem and ProvisioningSystemInventory to trigger a new inventory (else every 1 hour a inventory is run) to make the new plugin available in your store.
3. Check out zervicepoint-powershell-snippets and extend your new plugin by adding additional activities and data sources.
