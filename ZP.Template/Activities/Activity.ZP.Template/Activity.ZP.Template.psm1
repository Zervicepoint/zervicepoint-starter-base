
function New-ZPResource {
    <#
      .Synopsis
        Sample activity.
    
      .DESCRIPTION
        This is a sample activity that will return a joined string between Param1 and Param2 and output the variable 'Message'
    
      .PARAMETER Name
        This is a description and this parameter is required.
        
      .NOTES
         The New-ZPResource activity is part of the ZP.Template module.
    
      .EXAMPLE
        New-ZPResource -Name "Alice"

    #>
    Param(
        [Parameter(Mandatory=$false)]
        [string]$Name,

        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config
    )

    # Reads UICulture key from provider.xml and selects translation file used for Status output messages
    Import-LocalizedData -BindingVariable LocalizedData -UICulture $config.UICulture

    if ($Name) {
        $output = "Hello $($Name)"
        $Status = $LocalizedData.NewZPResource0
    } else {
        $Status = $LocalizedData.NewZPResource1
    }

    $hashTable = @{
        Message=$output
        ZPActivityStatus = $Status
    }

    return $hashTable
}

function Get-ZPResource {
    Param(
        [Parameter(Mandatory=$false)]
        [string]$Identity,

        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config 
    )

    $output = Get-ZPCommonFunction

    $hashTable = @{
        Test = $output;
        Message = "Hello $($Identity)"
    }

    return $hashTable
}

function Set-ZPResource {
    Param(
        [Parameter(Mandatory=$false)]
        [string]$Identity,

        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config 
    )

    Import-LocalizedData -BindingVariable LocalizedData -UICulture $config.UICulture

    $hashTable = @{
        ZPActivityStatus = $activityStatus
        ZPErrorCode = $errorCode
    }

    return $hashTable
}

function Remove-ZPResource {
    Param(
        [Parameter(Mandatory=$false)]
        [string]$Identity,

        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config
    )

    Import-LocalizedData -BindingVariable LocalizedData -UICulture $config.UICulture

    $hashTable = @{
        ZPActivityStatus = $activityStatus
        ZPErrorCode = $errorCode
    }

    return $hashTable
}

function Get-DayOrMonthBasedOnConfigKey {
    <#
      .Synopsis
        This activity will return todays day or month based on a providers.xml key
    
      .DESCRIPTION
        This activity will return todays day or month based on a providers.xml key

      .NOTES
        This example works if the providers.xml file contains a key (e.g <add key="DayOrMonth" value="Day" />) which is passed via the $Config parameter as a hashtable.
    #>
    Param(
        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config
    )

    if ($Config.DayOrMonth -eq "Month") {
        $Output = (Get-culture).DateTimeFormat.GetMonthName((Get-date).Month)
    }

    if ($Config.DayOrMonth -eq "Day") {
        $Output = (Get-Date).DayOfWeek.ToString()
    }

    $hashTable = @{
        Message = $Output
    }

    return $hashTable
}