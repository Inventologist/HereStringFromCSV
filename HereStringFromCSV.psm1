Function HereStringFromCSV {
    param (
        [parameter (Mandatory=$true)]$HereStringNameToCreate,
        [parameter (Mandatory=$true)]$SourceCSVFile,
        [parameter (Mandatory=$true)]$HereStringVARScope
    )
        
    $CSVData = Get-Content $SourceCSVFile | Out-String #Get the Data from the CSV file
    $HereStringCommand = '$' + "$HereStringNameToCreate" + ' = ' + '@"' + "`n" + $CSVData + '"@' #Build the Here-String command
    Invoke-Expression $HereStringCommand #Invoke the Here-String command 
    $HereStringCommand = '$' + "$HereStringVARScope" + ':' + "$HereStringNameToCreate" + ' = ' + '$' + "$HereStringNameToCreate" + ' | ConvertFrom-Csv' #Convert the Here-String Array to a CSV type Table 
    Invoke-Expression $HereStringCommand #Invoke the Here-String command
}