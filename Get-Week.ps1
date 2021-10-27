<#
.SYNOPSIS
  The "Get-Week" function returns the week number (out of the 52 weeks in a year) of the today's date by default, or if an argument is supplied to the "-DateTimeString" parameter then the week number returned is that of the supplied date time string.
  
.EXAMPLE
  PS C:\> Get-Date
  Wednesday, October 27, 2021 10:43:30 AM

  PS C:\> Get-Week
  43

  PS C:\> (Get-Date).AddYears(-1).ToString()
  10/27/2020 10:43:43 AM

  PS C:\> Get-Week -DateTimeString (Get-Date).AddYears(-1).ToString()
  44    



  Here we see that when the function is run without any arguments, that it returns the number of the week for the current date.  If an argument is given to the "-DateTimeString" parameter, then the week number returned is in relation to the supplied date time string value.

.NOTES
  Name:  Get-Week.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2021-10-27 | Initial Version
  Dependencies:  
  Notes:
  - This was where I retrieved the basic syntax for the code below:  https://devblogs.microsoft.com/scripting/powertip-get-week-of-year-with-powershell/

  .
#>
function Get-Week {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $DateTimeString
  )
  
  begin {}
  
  process {
    
    if ($DateTimeString) {
      Get-Date $DateTimeString -UFormat %V
    }
    else {
      Get-Date -UFormat %V
    }

  }
  
  end {}
}