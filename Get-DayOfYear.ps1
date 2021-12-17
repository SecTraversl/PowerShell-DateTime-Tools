<#
.SYNOPSIS
  The "Get-DayOfYear" function displays the current day out of the 365 days in the year.

.EXAMPLE
  PS C:\> Get-Date
  Thursday, December 16, 2021 11:27:23 PM

  PS C:\> Get-DayOfYear
  350



  Here we first display the current full date and then we run the function to display what day of the year it is.

.NOTES
  Name:  Get-DayOfYear.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2021-12-16 | Initial Version
  Dependencies:  
  Notes:
  - This was helpful:  https://jdhitsolutions.com/blog/powershell/3377/friday-fun-get-day-of-the-year-with-powershell/

  .
#>
function Get-DayOfYear {
  [CmdletBinding()]
  param ()
  
  begin {}
  
  process {
    (Get-Date).DayOfYear
  }
  
  end {}
}