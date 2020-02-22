$package = 'drivereasyfree'
$version = '5.6.13.33482'

$params = @{
    PackageName  = $package;
    FileType       = 'exe';
    SilentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-';
    Url            = "https://www.drivereasy.com/header/DriverEasy_Setup.exe"
	url64bit	   = "https://www.drivereasy.com/header/DriverEasy_Setup.exe"
    Checksum       = 'DE8E45DDB331851EECEE1C8D03BFC2DF2167D7491AAF28C6352910024B32CE90'
	Checksum64     = 'DE8E45DDB331851EECEE1C8D03BFC2DF2167D7491AAF28C6352910024B32CE90'
    ChecksumType   = 'sha256'
	ChecksumType64 = 'sha256'
}

Install-ChocolateyPackage @params