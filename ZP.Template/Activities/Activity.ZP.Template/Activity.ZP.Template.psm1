
function New-ZPResource {
    <#
      .Synopsis
        Sample activity.
    
      .DESCRIPTION
        This is a sample activity that will return a joined string between Param1 and Param2 and output the variable 'Message'
    
      .PARAMETER Param1
        This is a description and this parameter is required.

      .PARAMETER Param2
        This is a description. This parameter was not required.
        
      .NOTES
         The New-ZPADUser activity is part of the ZervicePoint.Activity.ActiveDirectory module.    
    
      .EXAMPLE
        New-ZPResource -Identity "Test"

    #>
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Param1,

        [Parameter(Mandatory=$false)]
        [string]$Param2,

        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config
    )

    $output = "$($Param1) $($Param2)"
    return @{
        Message=$output
    }
}

function Get-ZPResource {
    Param(
        [Parameter(Mandatory=$false)]
        [string]$Identity,

        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config 
    )

    $output = Get-ZPCommonFunction
    @{
        ZPActivityStatus = "Successfully retrieved data for $($Identity)";
        Test = $output;
        Message = "Hello World"
    }
}

function Set-ZPResource {
    Param(
        [Parameter(Mandatory=$false)]
        [string]$Identity,

        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config 
    )
}

function Remove-ZPResource {
    Param(
        [Parameter(Mandatory=$false)]
        [string]$Identity,

        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config 
    )
}