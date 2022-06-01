@echo off

if "%~1" neq "" goto :%~1

powershell -File %cd%\wsl2.ps1
pause
call :reboot tools
goto :eof 

:tools
powershell -File %HOMEPATH%\Desktop\test\tools.ps1

ECHO "**************"
ECHO "Install Docker"
ECHO "**************"

wsl sudo apt install apt-transport-https ca-certificates curl software-properties-common
wsl curl -fsSL https://download.docker.com/linux/ubuntu/gpg ^| sudo apt-key add -
wsl sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
wsl sudo apt-cache policy docker-ce
wsl sudo apt install docker-ce
wsl sudo usermod -aG docker ${USER}

ECHO "**************"
ECHO "Install Packer"
ECHO "**************"

wsl curl -fsSL https://apt.releases.hashicorp.com/gpg ^| sudo apt-key add -
wsl sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com focal main"
wsl sudo apt install packer

ECHO "***************"
ECHO "Install Vagrant"
ECHO "***************"

wsl sudo apt install vagrant
wsl export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

ECHO "***************"
ECHO "Install Ansible"
ECHO "***************"

wsl sudo apt-add-repository --yes --update ppa:ansible/ansible
wsl sudo apt install ansible

ECHO "***********"
ECHO "Install Git"
ECHO "***********"

wsl sudo add-apt-repository ppa:git-core/ppa -y
wsl sudo apt install git

call :reboot finish
goto :eof

:finish
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('DevOps academy components installation is complited', 'DevOps academy', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
goto :eof

:reboot
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce /t REG_SZ /d "\"%~dpf0\" %~1" /v  RestartMyScript /f 
shutdown /r /t 0
