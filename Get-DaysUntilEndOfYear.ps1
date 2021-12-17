<#
.SYNOPSIS
  The "Get-DaysUntilEndOfYear" function returns the days / time left until the beginning of the next year.

.EXAMPLE
  PS C:\> Get-Date
  Thursday, December 16, 2021 11:46:23 PM

  PS C:\> Get-DaysUntilEndOfYear

  Days              : 15
  Hours             : 0
  Minutes           : 13
  Seconds           : 34
  Milliseconds      : 437
  Ticks             : 12968144371311
  TotalDays         : 15.009426355684
  TotalHours        : 360.226232536417
  TotalMinutes      : 21613.573952185
  TotalSeconds      : 1296814.4371311
  TotalMilliseconds : 1296814437.1311



  Here we display the current date and then we run the function to display the amount of time left in the year.

.NOTES
  Name:  Get-DaysUntilEndOfYear.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2021-12-16 | Initial Version
  Dependencies:  
  Notes:
  - This was helpful:  https://devblogs.microsoft.com/scripting/powertip-use-powershell-to-show-how-many-days-until-the-end-of-the-year/

  .
#>
function Get-DaysUntilEndOfYear {
  [CmdletBinding()]
  param ()
  
  begin {}
  
  process {
    $Now = Get-Date
    $NextYear = $Now.Year + 1
    $BeginningOfNextYear = Get-Date "$($NextYear)-01-01"
    New-TimeSpan -Start (Get-Date) -End $BeginningOfNextYear
  }
  
  end {}
}