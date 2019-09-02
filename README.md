# HereStringFromCSV
Create a Here-String from a CSV.  This enables the storage of Variables **INSIDE** of the CSV and have them expanded... upon Here-String creation.  

The values can be normally addressed and do not require {$ExecutionContext.InvokeCommand.ExpandString($VariableName)} to force an extraction.  During the HereString creation, the values are expanded, so they are stored EXPANDED in the HereString.

Possible future use with traditionally structured INI files also... stay tuned.

# Uses:
Use this to have a CSV serve as a settings file, or an INI File.  You can store filenames, directory names, program paths, etc all with variables that will build themselves into the $HereStringNameToCreate

I use this to store valid menu choices and their corresponding paths (whether that be a function or an executable) in my RunMahStuff menu system.

# Structure
**Variables**:  
$HereStringNameToCreate: What variable you want to store the CSV Data.  
$SourceCSVFile: Give the full path to the CSV file.  Use Variables such as $PSScriptRoot if you want to grab the current running script directory.  
$HereStringVARScope: usually you would want this to be Global or at least Script, but I gave you the option to set it.

**Process**:  
1) Retrieve the CSV Data as a string  
2) Carefully build a Here-String Command in the general format of  
$HereStringNameToCreate = @"$CSVDATA"@  
3) Invokes that command  
4) Carefully builds the command that converts the Here-String to CSV addressable data in the general format of:  
$HereStringNameToCreate = $HereStringNameToCreate | ConvertFrom-Csv  
5) Invokes that command

Now the data is addressable like: $Runtable.Choice (given that Choice is a column name in the CSV)

# How to use HereStringFromCSV:  
Call function with appropriate data

**EXAMPLE**:
<pre><code>
HereStringFromCSV -HereStringNameToCreate RunTable -HereStringVARScope Global -SourceCSVFile $CRSPath\$CSVFile
</code></pre>

**Be sure to Load up the module with**:  
<pre><code>
Import-Module $PathToModule\HereStringFromCSV.psm1 
</code></pre>
