#region Functions
function install-PreReqs {
	choco install nvm
	choco install dotnetcore-sdk
	choco install git
}

function install-RequiredPrograms {
	choco install zoom
	choco install slack
	choco install googlechrome
	choco install firefox
}

function install-FETools {
	choco install visualstudiocode
	choco install vscode-eslint
	choco install vscode-prettier
	choco install vscode-powershell
}

function install-BETools {
	choco install visualstudio2019professional
	choco install docker-for-windows
	choco install docker-desktop
	choco install postman
	choco install fiddler
	choco install soapui
	choco install azure-data-studio
	choco install datagrip
	choco install microsoftazurestorageexplorer
	choco install sql-server-management-studio
	choco install wsl2
}

function install-AdditionalPrograms {
	choco install notepadplusplus
	choco install cmder
	choco install f.lux
	choco install windirstat
	choco install hwmonitor
}

function install-UsefulTools {
	choco install powertoys
	choco install p4merge
	choco install kdiff3
	choco install git-fork
	choco install poshgit
    choco install oh-my-posh
	choco install ditto
    choco install sharex
}

function installToolsSwitch([string]$prompt, [scriptblock]$function) {
	Switch($prompt)
	{
		Y{ Invoke-Command $function }
		N{ continue }
		Default { continue }

	}
}

#endregion Functions

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation

#Pre Reqs
install-PreReqs

#Required Programs
install-RequiredPrograms

#FE Dev Tools
Write-Host "This section contains programs and tooling for FE Dev:
Visual Studio Code
Eslint code extension
Prettier code extension
Powershell code extension

Styled-Components Extension is **NOT** included but will need to be installed manually"

$Prompt = Read-host "Do you want to install FE Dev Tools? (Y/N)" 
installToolsSwitch $Prompt ${function:install-FETools}

#BE Dev Tools
Write-Host "This section contains programs and tooling for BE Dev:
Visual Studio 2019 Professional - this might cause a restart
Docker for windows
Docker-Desktop
Postman
Fiddler
SoapUI
Azure Data Studio
DataGrip
SQL Server Management Studio
Windows Subsystem for Linux"

$Prompt = Read-host "Do you want to install BE Dev Tools? (Y/N)" 
installToolsSwitch $Prompt ${function:install-BETools}

#Useful Programs
Write-Host "This section contains useful additional programs:
Notepad++
Cmder - Shell
f.lux
windirstat
hwmonitor"

$Prompt = Read-host "Do you want to install Additional Programs? (Y/N)" 
installToolsSwitch $Prompt ${function:install-AdditionalPrograms}

#Useful Tools
Write-Host "This section contains useful tools:
PowerToys
P4Merge
KDiff3
SoapUI
Git-Fork
Posh-Git
Ditto"

$Prompt = Read-host "Do you want to install Useful Tools? (Y/N)" 
installToolsSwitch $Prompt ${function:install-UsefulTools}

nvm on
nvm install latest
#This is to make sure upp-app installs correctly when running
Write-Host "Installing Windows Build Tools"
npm install --global --production windows-build-tools