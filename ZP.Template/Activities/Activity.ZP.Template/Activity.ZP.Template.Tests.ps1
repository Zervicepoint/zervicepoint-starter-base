BeforeAll {    
    Import-Module $PSCommandPath.Replace('.Tests.ps1', '.psm1') -Force
    $modulePath = Split-Path $PSCommandPath | Split-Path    
    $moduleName = ($PSCommandPath | Split-Path -Leaf) -replace ".Tests.ps1",""
    $modulePath = "$modulePath\$moduleName"
}

Describe 'Module-level tests' {
    it 'the module imports successfully' {   
        (Get-Module -Name $moduleName | Measure-Object).Count | Should -BeGreaterOrEqual 1        
    }

    it 'passes all default PSScriptAnalyzer rules' {
        Invoke-ScriptAnalyzer -Path "$($modulePath)\$($moduleName).psm1" -ExcludeRule "PSUseShouldProcessForStateChangingFunctions" | should -BeNullOrEmpty
    }
}