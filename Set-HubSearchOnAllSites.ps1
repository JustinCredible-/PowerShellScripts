#This script requires you to have Site Admin or Owner permissions on all sites
#Import CSV file containing at least one column called "url" that contains the Site URL to be updated
$csv = "C:\path\to\file.csv"
$sites = Import-Csv $csv
#Connect to each site using PnP.PowerShell module and change search settings to search across all sites in the Hub
foreach ($url in $sites.url) {
  Write-Host "Connecting to"$url
  Connect-PnPOnline -Url $url -UseWebLogin
  Write-Host "Changing search settings for"$url
  Set-PnPSearchSettings -SearchScope Hub
}
