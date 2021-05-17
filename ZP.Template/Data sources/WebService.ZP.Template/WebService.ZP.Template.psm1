function Get-ZPResource {
    Param(    
    [string]$Identity,
    
    [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
    [Hashtable]$Config    
    )

    if ($Config.DayOrMonth -eq "Month") {
        $Output = (Get-culture).DateTimeFormat.GetMonthName((Get-date).Month)
    }
    
    if ($Config.DayOrMonth -eq "Day") {
        $Output = (Get-Date).DayOfWeek.ToString()
    }

    if ($output) {
        $output
    }

}

