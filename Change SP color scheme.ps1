<#Install PNP Powershell module in admin mode #>
#Install-Module -Name "PnP.PowerShell"
<#Log in to your tenant #>
Connect-PnPOnline "https://<yourtenant>.sharepoint.com" -Interactive
<# Get all custom themes that are available in the tenant #>
Get-PnPTenantTheme
<# Get a specific theme by name, and as JSON #>
#Get-PnPTenantTheme "Elis main theme" -asJson

<# Create color palette variable #>
$color_palette = @{
"themePrimary" = "#1d1a39";
"themeLighterAlt" = "#dad8e7";
"themeLighter" = "#bab7d1";
"themeLight" = "#9c99bb";
"themeTertiary" = "#009f9d";
"themeSecondary" = "#00456e";
"themeDarkAlt" = "#524e7a";
"themeDark" = "#3e3a64";
"themeDarker" = "#2c294e";
"neutralLighterAlt" = "#faf9f8";
"neutralLighter" = "#f3f2f1";
"neutralLight" = "#edebe9";
"neutralQuaternaryAlt" = "#e1dfdd";
"neutralQuaternary" = "#d0d0d0";
"neutralTertiaryAlt" = "#c8c6c4";
"neutralTertiary" = "#a19f9d";
"neutralSecondary" = "#605e5c";
"neutralSecondaryAlt" = "#8a8886";
"neutralPrimaryAlt" = "#3b3a39";
"neutralPrimary" = "#323130";
"neutralDark" = "#201f1e";
"black" = "#000000";
"white" = "#ffffff";
}
<# Add theme to tenant #>
Add-PnPTenantTheme -Identity "Company Main Theme" -Palette $color_palette -IsInverted $false
<# Set the theme on a site #>
#Set-PnPWebTheme -Theme "Emixa Main Theme" -WebUrl "https://<yourtenant>.sharepoint.com/sites/ThemeTestSite"