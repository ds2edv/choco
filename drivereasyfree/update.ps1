Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

function Update-OnETagChanged() {
  param(
    [uri]$execUrl,
    [string]$saveFile = ".\info",
    [scriptblock]$OnETagChanged,
    [scriptblock]$OnUpdated
  )

  $request = [System.Net.WebRequest]::CreateDefault($execUrl)

  try {
    $response = $request.GetResponse()
    $etag = $response.Headers.Get("ETag")
  }
  finally {
    $response.Dispose()
    $response = $null
  }

  $saveResult = $false
  if (!(Test-Path $saveFile) -or ($global:au_Force -eq $true)) {
    $result = . $OnETagChanged
    $saveResult = $true
  }
  else {
    $existingInfo = (Get-Content $saveFile -Encoding UTF8 -TotalCount 1) -split '\|'

    if ($existingInfo[0] -ne $etag) {
      $result = . $OnETagChanged
      $saveResult = $true
    }
    else {
      $result = . $OnUpdated
      $result["Version"] = $existingInfo[1]
      $result["ETAG"] = $existingInfo[0]
      $saveResult = $false
    }
  }

  if ($saveResult) {
    $result["ETAG"] = $etag
    "$($result["ETAG"])|$($result["Version"])" | Out-File $saveFile -Encoding utf8 -NoNewline
  }

  return $result
}

function global:au_SearchReplace {
   @{
      'tools\chocolateyInstall.ps1' = @{
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
	  "(?i)(^[$]version\s*=\s*)'.*'"        = "`${1}'$($Latest.Version)'"
	  }
   }
}

function GetResultInformation([string]$url32) {
  $dest = "C:\devop\automatic\drivereasyfree\tools\DriverEasy_Setup.exe"
  Get-WebFile $url32 $dest | Out-Null
  $checksumType = 'sha256'
  $version = Get-Item $dest | ForEach-Object { $_.VersionInfo.ProductVersion }
  $version = $version -replace(' ','')
  $checksum32 = Get-FileHash $dest -Algorithm $checksumType | ForEach-Object Hash
  Remove-Item C:\devop\automatic\drivereasyfree\tools\*.exe -force

  return @{
    URL32          = $url32
    Version        = $version
    Checksum32     = $checksum32
    ChecksumType32 = $checksumType
  }
}

function global:au_GetLatest {
  $url32 = 'https://www.drivereasy.com/header/DriverEasy_Setup.exe'

  Update-OnETagChanged -execUrl "https://www.drivereasy.com/header/DriverEasy_Setup.exe" `
    -OnETagChanged {
    GetResultInformation $url32
  } -OnUpdated { @{ URL32 = $url32; }}
}

update -ChecksumFor none -NoCheckChocoVersion
