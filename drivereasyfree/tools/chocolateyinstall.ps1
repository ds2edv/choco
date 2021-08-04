$ErrorActionPreference = 'Stop';
$version = '5.7.0'
$package = 'drivereasyfree'

$params = @{
    PackageName    = $package;
    FileType       = 'exe';
    SilentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-';
    Url            = "https://www.drivereasy.com/header/DriverEasy_Setup.exe"
	url64bit	   = "https://www.drivereasy.com/header/DriverEasy_Setup.exe"
    Checksum       = '1686DF60C1702329B4135812668620AD396B421C30FE4C4C04038520D7940649'
	Checksum64     = '1686DF60C1702329B4135812668620AD396B421C30FE4C4C04038520D7940649'
    ChecksumType   = 'sha256'
	ChecksumType64 = 'sha256'
	softwareName   = 'Driver Easy*'
}

Install-ChocolateyPackage @params
