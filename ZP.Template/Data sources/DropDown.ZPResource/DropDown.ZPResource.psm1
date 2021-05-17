function Search($config, $search, $category)
{    
     @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday") | Select-Object @{
        Name="Id";
        Expression = {
            $_
        }
    },
    @{
        Name="Name";
        Expression = {
            $_
        }
    }
}

function Validate($config, $search) 
{
    return @()
}

function GetCategories($config) 
{
    return @()
}

function GetDefault($config)
{    
    $day = (Get-Date).DayOfWeek.ToString()
    [PSCustomObject]@{
        Id = $day
        Name = $day
    }
}