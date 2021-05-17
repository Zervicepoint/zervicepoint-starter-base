function Get-ZPTable {
    Param(
        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config 
    )

    $table = GetTableData
    return $table
}

function Get-ZPTableWithParameter {
    Param(
        [string]$Search,

        [Parameter(Mandatory = $false, ParameterSetName = "Hidden")]
        [Hashtable]$Config 
    )

    $table = GetTableData
    $table | Where-Object { $_.Name -like "$Search*"}
}

function GetTableData {
    $table = @(
        [pscustomobject]@{
            Id = 1
            Name = "januari"
            NumberOfDays = 31
        },
        [pscustomobject]@{
            Id = 2
            Name = "february"
            NumberOfDays = 28
        },
        [pscustomobject]@{
            Id = 3
            Name = "march"
            NumberOfDays = 31
        },
        [pscustomobject]@{
            Id = 4
            Name = "april"
            NumberOfDays = 30
        },
        [pscustomobject]@{
            Id = 5
            Name = "may"
            NumberOfDays = 31
        },
        [pscustomobject]@{
            Id = 6
            Name = "june"
            NumberOfDays = 30
        },
        [pscustomobject]@{
            Id = 7
            Name = "july"
            NumberOfDays = 31
        },
        [pscustomobject]@{
            Id = 8
            Name = "august"
            NumberOfDays = 31
        },
        [pscustomobject]@{
            Id = 9
            Name = "september"
            NumberOfDays = 30
        },
        [pscustomobject]@{
            Id = 10
            Name = "october"
            NumberOfDays = 31
        },
        [pscustomobject]@{
            Id = 11
            Name = "november"
            NumberOfDays = 30
        },
        [pscustomobject]@{
            Id = 12
            Name = "december"
            NumberOfDays = 31
        }
    )

    return $table
}