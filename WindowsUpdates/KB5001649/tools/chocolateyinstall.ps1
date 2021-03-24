$msuData = @{
    '10.0.19041' = @{
        Url = "http://download.windowsupdate.com/d/msdownload/update/software/updt/2021/03/windows10.0-kb5001649-x86_781a5706e11026c9fc48013e86e38a3fc83aeef7.msu"
        Checksum = '981736C13A670F3A6F068B05AA493EF540BE0BE40DDC2BBE239BE10B7EC8BA56'
        Url64 = "http://download.windowsupdate.com/d/msdownload/update/software/updt/2021/03/windows10.0-kb5001649-x64_aca549448414a5ad559c742c39e9342468a23eb5.msu"
        Checksum64 = '26FBB638BB19964A0D2EB44801363428E856A82AF7010AA121ECC31A7D15C21F'
    }
    '10.0.19042' = @{
        Url = "http://download.windowsupdate.com/d/msdownload/update/software/updt/2021/03/windows10.0-kb5001649-x86_781a5706e11026c9fc48013e86e38a3fc83aeef7.msu"
        Checksum = '981736C13A670F3A6F068B05AA493EF540BE0BE40DDC2BBE239BE10B7EC8BA56'
        Url64 = "http://download.windowsupdate.com/d/msdownload/update/software/updt/2021/03/windows10.0-kb5001649-x64_aca549448414a5ad559c742c39e9342468a23eb5.msu"
        Checksum64 = '26FBB638BB19964A0D2EB44801363428E856A82AF7010AA121ECC31A7D15C21F'
    }
}

chocolateyInstaller\Install-WindowsUpdate -Id 'KB5001649' -MsuData $msuData -ChecksumType 'sha256'