$ErrorActionPreference = 'Stop'
$packageName  = 'pendingreboot-psmodule'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version      = '0.9.0.6'

$PSversion = $PSVersionTable.PSVersion.Major
if ($PSversion -lt "5")
   {
    Write-Warning "PowerShell < v5 detected."
    Write-Warning "$packageName installs via the PowerShell Gallery and thus PowerShell v5 is a prerequisite."
    Write-Warning "If PowerShell v5 was installed as a dependency, you need to reboot and reinstall this package."
	throw
   }

if (Get-Module -ListAvailable -Name PendingReboot -ErrorAction SilentlyContinue) {
    Uninstall-Module -Name PendingReboot -AllVersions -Force 
 }
 
 Get-PackageProvider -Name NuGet -Force
 Install-Module -Name PendingReboot -Scope AllUsers -RequiredVersion $version -AllowClobber -Force
 
