# Script to copy .nupkg files to local nuget repo and clear the associated packages folder

$ConfigFilePath = "localnuget.json";

function GetConfigValuesFromFile($path)
{
    $Config = Get-Content -Path $path -Raw| ConvertFrom-Json

    $global:PackagesDirectory = $Config.PackagesDirectory
    $global:ProjectPath = $Config.ProjectPath;
    $global:LocalNugetPath = $Config.LocalNugetPath;
}

function CopyPackagesToFolder($source, $destination)
{
    $ExclusionList = @("netstandard2.0")
    
    $SourceFiles = $source + '/*';

    Copy-Item -Force $SourceFiles -Destination $destination -Exclude $ExclusionList
}

function DeleteFolder($path)
{
    Remove-Item -path $path -recurse
}


# Perform Steps

GetConfigValuesFromFile -path $ConfigFilePath

CopyPackagesToFolder -source $global:ProjectPath -destination $global:LocalNugetPath

DeleteFolder -path $global:PackagesDirectory