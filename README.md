# zervicepoint-starter-base
Starter template for Zervicepoint plugin using PowerShell

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
Invoke-Plaster -TemplatePath .\ -DestinationPath "C:\Program Files\Zipper\Zervicepoint\Provider extensions\"
```

Invoke-Plaster will prompt for the following details:

* Enter **name** of plugin *Set Activity,Table,WebService and Shared module suffix/prefix names*
* Enter the **version** number of this plugin *Set version number in PowerShell manifest*
* Enter the **author** of this plugin *Set author property in PowerShell manifest*
* Enter the **company** *Set Company and Copyright property in PowerShell manifest*

It will then scaffold a plugin in the *Provider extensions* folder of Zervicepoint.

![Output](images/invoke-plaster-sample.PNG)

## Next steps

1. Create a **pluginname**.providers.xml file to inventory the plugin and make it available in your Zervicepoint store.
2. Check out zervicepoint-powershell-snippets and extend your new plugin by adding additional activities and data sources.


## This is a example

```powershell
New-ZPProviderXML -PackageName "My awesome plugin" -ProviderType Activity -AssemblyType PowerShell -SourcePath "C:\Program Files\Zipper\Zervicepoint\Provider extensions\Activities"
# Creates My awesome plugin.provisioningsystem.provider.xml in C:\Program Files\Zipper\Zervicepoint\ProvisioningSystem\ and will inventory PowerShell providers from C:\Program Files\Zipper\Zervicepoint\Provider extensions\Activities

New-ZPProviderXML -PackageName "My awesome plugin" -ProviderType DataSource -AssemblyType PowerShell -SourcePath "C:\Program Files\Zipper\Zervicepoint\Provider extensions\Data sources"
# Creates My awesome plugin.clientwebservice.provider.xml in C:\Program Files\Zipper\Zervicepoint\ClientWebService\ and will inventory PowerShell providers from C:\Program Files\Zipper\Zervicepoint\Provider extensions\Data sources
```


## This is another sample

```powershell
# Copy paste or run the following command lines to create a manifest file for activities

$xml = @"
<?xml version="1.0" encoding="utf-8"?>
<providers>
<provider name="My awesome plugin">
    <assembly type="Zipper.ZervicePoint.ProvisioningSystem.PowerShellProvider.PowerShellEngine" assemblyFile="C:\Program Files\Zipper\ZervicePoint\ProvisioningSystem\Providers\PowerShell\Zipper.ZervicePoint.ProvisioningSystem.PowerShellProvider.dll" />
    <configuration>
    <add key="scriptpath" value="C:\Program Files\Zipper\Zervicepoint\Provider extensions\My awesome plugin\Activities\" />
    <add key="UICulture" value="en-US" />
    </configuration>
</provider>
</providers>
"@

$xml | Out-File -FilePath 'C:\Program Files\Zipper\Zervicepoint\ProvisioningSystem\My awesome plugin.provisioningsystem.providers.xml' -Encoding UTF8

# Restart ProvisioningSystem to inventory activities
Restart-Service -Name ProvisioningSystem

```

```powershell
# Copy paste or run the following command lines to create a manifest file for data sources

$xml = @"
<?xml version="1.0" encoding="utf-8"?>
<providers>
<provider name="My awesome plugin">
    <assembly type="Zipper.ZervicePoint.ProvisioningSystem.PowerShellProvider.PowerShellEngine" assemblyFile="C:\Program Files\Zipper\ZervicePoint\Web\ClientWebService\Bin\Zipper.ZervicePoint.ProvisioningSystem.PowerShellProvider.dll" />
    <configuration>
    <add key="scriptpath" value="C:\Program Files\Zipper\Zervicepoint\Provider extensions\My awesome plugin\Data sources\" />
    </configuration>
</provider>
</providers>
"@


$xml | Out-File -FilePath 'C:\Program Files\Zipper\Zervicepoint\ClientWebService\My awesome plugin.clientwebservice.providers.xml' -Encoding UTF8

# Restart ProvisioningSystemInventory to inventory data sources
Restart-Service -Name ProvisioningSystemInventory


```