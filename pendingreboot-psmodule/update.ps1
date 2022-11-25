Import-Module AU

$softwareName = 'pendingreboot-psmodule'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^[$]version\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
    }
  }
}

function global:au_GetLatest {
  $url = Get-RedirectedUrl 'https://www.powershellgallery.com/packages/PendingReboot/'
  $version = $url -split '\/' | Select-Object -last 1

  return @{
    Version     = $version
    PackageName = 'pendingreboot-psmodule'
  }
}

function global:au_AfterUpdate {
  . C:\devop\scripts\mail.ps1
  $version = $Latest.Version
  $packagename = "Pending Reboot PS-Module"
  Mail
}

update -ChecksumFor none -NoCheckChocoVersion
