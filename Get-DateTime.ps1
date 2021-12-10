<#
.SYNOPSIS
  The "Get-DateTime" function is a wrapper for the 'Get-Date' cmdlet with various preset switch parameters that return the date/time stamp in various ways that have proven useful.

.EXAMPLE
  PS C:\> Get-DateTime
  2021-12

  PS C:\> Get-DateTime -YearMonthDay
  2021-12-10

  PS C:\> Get-DateTime -Full
  2021-12-10_1310

  PS C:\> Get-DateTime -TenThousandths
  2021-12-10_131049.7595

  PS C:\> Get-DateTime -ZuluToLocalTime24HrClock
  2021-12-10 13:10:56PT



  Here we run the function with various switch parameters to demonstrate the output associated with each.

.NOTES
  Name:  Get-DateTime.ps1
  Author:  Travis Logue
  Version History:  2.1 | 2021-12-10 | Re-worked this tool
  Dependencies:  
  Notes:
  - This was helpful in citing some nice succinct syntax (Get-Date).ToString("yyyy-MM-dd") :  https://stackoverflow.com/questions/22826185/setup-default-date-format-like-yyyy-mm-dd-in-powershell
  - Here we have various .NET datetime format specifiers used in an example: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-date?view=powershell-7.1#example-3--get-the-date-and-time-with-a--net-format-specifier
  - Here we have an exhaustive list of the .NET datetime format specifiers: https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings?view=netframework-4.8


  .
#>
function Get-DateTime {
  [CmdletBinding()]
  [Alias('MyDateTime')]
  param (
    [Parameter(HelpMessage = "The -YearMonthDay switch will display yyyy-MM-dd")]
    [switch]
    $YearMonthDay,
    [Parameter(HelpMessage = "The -Full switch will display yyyy-MM-dd_HHmm")]
    [switch]
    $Full,
    [Parameter(HelpMessage = 'Date/Time stamp to the Ten Thousandths of a second')]
    [switch]
    $TenThousandths,
    [Parameter()]
    [switch]
    $ZuluToLocalTime24HrClock
  )
  
  begin {}
  
  process {
    
    if ($ZuluToLocalTime24HrClock) {
      $ArrayOfDateFormats = @( (Get-Date).GetDateTimeFormats() )
      $LocalTime24HrClockWithTimeZone = $ArrayOfDateFormats[94] + "PT"
      Write-Output $LocalTime24HrClockWithTimeZone
    }
    else {
      if ($Full) {
        Get-Date -Format yyyy-MM-dd_HHmm
      }
      elseif ($YearMonthDay) {
        Get-Date -Format yyyy-MM-dd
        # Another way: (Get-Date).ToString("yyyy-MM-dd")
      }
      elseif ($TenThousandths) {
        Get-Date -Format yyyy-MM-dd_HHmmss.ffff
      }
      else {
        Get-Date -Format yyyy-MM
      }
    }

  }
  
  end {}
}