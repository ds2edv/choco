$msuData = @{
    '10.0.18362' = @{
        Url = "http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/06/windows10.0-kb4567512-x86_739e4438ef1c036a4b00641a9ab9bf609bb9f39e.msu"
        Checksum = 'BE09C6F714E38821E7DAB11131F9A9719B2CF64A8F8D9814D7D751858811CA72'
        Url64 = "http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/06/windows10.0-kb4567512-x64_2ea636c671529de2154d48a1181c0f02cd919da5.msu"
        Checksum64 = 'FFB0BC7F0D87F81486EB0EF8DDE5D94D5ABA789FB4A9E05A94AB2C641078AA9D'
    }
    '10.0.18363' = @{
        Url = "http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/06/windows10.0-kb4567512-x86_739e4438ef1c036a4b00641a9ab9bf609bb9f39e.msu"
        Checksum = 'BE09C6F714E38821E7DAB11131F9A9719B2CF64A8F8D9814D7D751858811CA72'
        Url64 = "http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/06/windows10.0-kb4567512-x64_2ea636c671529de2154d48a1181c0f02cd919da5.msu"
        Checksum64 = 'FFB0BC7F0D87F81486EB0EF8DDE5D94D5ABA789FB4A9E05A94AB2C641078AA9D'
    }
}

chocolateyInstaller\Install-WindowsUpdate -Id 'KB4567512' -MsuData $msuData -ChecksumType 'sha256'