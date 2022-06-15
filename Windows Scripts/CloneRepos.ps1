$RepoURL = "<Repo URL goes here>"

Write-Output "# Pre-requisites #"
Write-Output "1. SSH set up on your local machine."
Read-Host "Press Enter to continue, or ctrl+c to cancel."

$repoPath = Read-Host "Please enter the path you want your repos to be cloned to"
$repoStorageLocation =  Join-Path -Path $repoPath -ChildPath "<Name Goes Here>"
$accessToken = Read-Host "Please enter your Access Token: "

$browser = New-Object System.Net.WebClient
$browser.Proxy.Credentials =[System.Net.CredentialCache]::DefaultNetworkCredentials 

$credBytes = [System.Text.Encoding]::ASCII.GetBytes(":" + $accessToken);
$credentials = [System.Convert]::ToBase64String($credBytes);

$headers = @{
    Authorization = "Basic $credentials"
}

$RepoListJson = Invoke-RestMethod -Method 'Get' -Uri $RepoURL -Headers $headers 

foreach($repo in $RepoListJson.value){
    If(!(test-path $repoStorageLocation))
    {
      New-Item -ItemType Directory -Force -Path $repoStorageLocation
    }
    cd $repoStorageLocation
    &git clone $repo.sshUrl
}