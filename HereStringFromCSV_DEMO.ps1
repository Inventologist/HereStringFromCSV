Import-Module "$PSScriptRoot\HereStringFromCSV.psm1"

$YourWindowsDirectory = $env:SystemRoot
$CurrentScriptDir = $PSScriptRoot

#Create the Here-String
HereStringFromCSV -HereStringNameToCreate SampleVariable -SourceCSVFile $PSScriptRoot\SampleCSV.csv -HereStringVARScope Global

#Display Data
Write-Host "The entire table comes out as: " -f Red
$SampleVariable | Format-Table -AutoSize

Write-Host "Now the data from the first column of the CSV can be addressed like so:" -f Red
$SampleVariable.choice

Write-Host "And jsut like expected, you can pick a piece of data from a certain position like so:" -f Red
$SampleVariable.choice[7]