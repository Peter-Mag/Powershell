$orgName="enter-orgname"
$acctName="my-m365-account@example.com"

#set-executionpolicy remotesigned

#Check and install AzureAD and M365 modules
if (Get-Module -ListAvailable -Name AzureAD) {
    Write-Host "AzureAD already exists"
} 
else {
    Install-Module AzureAD -AllowClobber
}

if (Get-Module -ListAvailable -Name MSOnline) {
    Write-Host "Module MSOnline already exists"
} 
else {
    Install-Module MSOnline -AllowClobber
}
if (Get-Module -ListAvailable -Name AzureAD) {
    Write-Host "Module AzureAD already exists"
} 
else {
    Install-Module AzureAD -AllowClobber
}
if (Get-Module -ListAvailable -Name AzureADPreview) {
    Write-Host "Module AzureADPreview already exists"
} 
else {
    Install-Module AzureADPreview -AllowClobber
}
if (Get-Module -ListAvailable -Name Microsoft.Online.SharePoint.PowerShell) {
    Write-Host "Module Microsoft.Online.SharePoint.PowerShell already exists"
} 
else {
    Install-Module Microsoft.Online.SharePoint.PowerShell
}
if (Get-Module -ListAvailable -Name ExchangeOnlineManagement) {
    Write-Host "Module ExchangeOnlineManagement already exists"
} 
else {
    Install-Module -Name ExchangeOnlineManagement
}
if (Get-Module -ListAvailable -Name PowerShellGet) {
    Write-Host "Module PowerShellGet already exists"
} 
else {
    Install-Module PowerShellGet -Force -AllowClobber
}
if (Get-Module -ListAvailable -Name MicrosoftTeams) {
    Write-Host "Module MicrosoftTeams already exists"
} 
else {
    Install-Module MicrosoftTeams -AllowClobber
}

#Azure Active Directory
Connect-MsolService
##Connect Azure AD
Connect-AzureAD
#SharePoint Online
Connect-SPOService -Url https://$orgName-admin.sharepoint.com
#Exchange Online
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName $acctName -ShowProgress $true
#Security & Compliance Center
Connect-IPPSSession -UserPrincipalName $acctName
#Teams and Skype for Business Online
Import-Module MicrosoftTeams
Connect-MicrosoftTeams
