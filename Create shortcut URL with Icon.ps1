#Variables creating local folder and download .ico file
$LocalIconFolderPath = "C:\URLIcon"
$SourceIcon = "https://my-website.com/assets/general/img/keeper.ico"
$DestinationIcon = "C:\URLIcon\keeper.ico" # You can change this destination


#Step 1 - Create a folder to place the URL icon
New-Item $LocalIconFolderPath -Type Directory

#Step 2 - Download a ICO file from a website into previous created folder
curl $SourceIcon -o $DestinationIcon

#Step 3 - Add the custom URL shortcut to your Desktop with custom icon
$new_object = New-Object -ComObject WScript.Shell
$destination = $new_object.SpecialFolders.Item('AllUsersDesktop')
$source_path = Join-Path -Path $destination -ChildPath '\\Company X downloads.lnk'
$source = $new_object.CreateShortcut($source_path)
$source.TargetPath = 'https://www.companyx.com/nl_NL/download.html'
$source.IconLocation = ”C:\URLIcon\keeper.ico”
$source.Save()