Write-Host "******************"
Write-Host "Install Chocolatey"
Write-Host "******************"

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Host "*****************"
Write-Host "Install Terraform"
Write-Host "*****************"

choco install terraform

Write-Host "******************"
Write-Host "Install VirtualBox"
Write-Host "******************"

winget install Oracle.VirtualBox

Write-Host "************************"
Write-Host "Install VisualStudioCode"
Write-Host "************************"

winget install Microsoft.VisualStudioCode -e

Write-Host "***********"
Write-Host "Install Git"
Write-Host "***********"

winget install -e --id Git.Git

Write-Host "*****************"
Write-Host "Install GitKraken"
Write-Host "*****************"

winget install -e --id Axosoft.GitKraken

Write-Host "*************"
Write-Host "Install Slack"
Write-Host "*************"

winget install -e --id SlackTechnologies.Slack

Write-Host "***************"
Write-Host "Install Vagrant"
Write-Host "***************"

winget install vagrant

Write-Host "*****************************"
Write-Host "Update & upgrade all packages"
Write-Host "*****************************"

wsl sudo apt update
wsl sudo apt upgrade

Write-Host "*****************************"
