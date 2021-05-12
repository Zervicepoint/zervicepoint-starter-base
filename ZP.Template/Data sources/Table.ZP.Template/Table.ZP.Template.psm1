function Get-ZPTable {    
    @{
        ZPActivityStatus = "Successfully retrieved data for $($Identity)"
    }
}

function Get-ZPTableWithParameter {
    Param(
        [string]$Search
    )
    @{
        ZPActivityStatus = "Successfully retrieved data for $($Identity)"
    }
}