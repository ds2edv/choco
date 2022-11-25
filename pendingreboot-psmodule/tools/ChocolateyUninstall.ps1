$ErrorActionPreference = 'Stop'
$packageName  = 'pendingreboot-psmodule'

Uninstall-Module -Name PendingReboot -AllVersions -Force
