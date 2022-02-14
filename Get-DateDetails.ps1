<#
.SYNOPSIS
  The "Get-DateDetails" function takes a given date/time string, attempts to convert it to a DateTime object using 'Get-Date' and then outputs the object as a formatted date time string (e.g. the -Format "yyyy-MM-dd HH:mm:ss.fff")

.EXAMPLE
  PS C:\> Get-DateDetails '2022-02-12 02:02:05.155Z'
  2022-02-11 18:02:05.155



  Here we give a date/time string to the function, and in return we get the detailed format of that timestamp in the timezone of the local machine.

.NOTES
  Name:  Get-DateDetails.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-02-14 | Initial Version
  Dependencies:  
  Notes:
  - 

  .
#>
function Get-DateDetails {
  [CmdletBinding()]
  [Alias('DateDetails')]
  param (
    [Parameter()]
    [string]
    $DateTimeString
  )
  
  begin {}
  
  process {
    Get-Date $DateTimeString -Format "yyyy-MM-dd HH:mm:ss.fff"
  }
  
  end {}
}