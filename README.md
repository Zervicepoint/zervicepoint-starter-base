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

Now lets invoke plaster to setup a new project based on a template.

```powershell
Invoke-Plaster -TemplatePath .\ -DestinationPath "C:\Program Files\Zipper\Zervicepoint\Provider extensions\"
```

Enter a "**PluginName**"