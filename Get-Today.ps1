<#
.SYNOPSIS
  The "Get-Today" function outputs the current date in the format of 'yyyy-MM-dd'.

.EXAMPLE
  PS C:\> Get-Today
  2022-01-31
  PS C:\>
  PS C:\> Today
  2022-01-31



  Here we run the function using its full name of "Get-Today" as well as its built-in alias "Today".

.NOTES
  Name:  Get-Today.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-08 | Initial Version
  Dependencies:  
  Notes:
  - 

  .
#>
function Get-Today {
  [CmdletBinding()]
  [Alias('Today')]
  param ()
  
  begin {}
  
  process {
    Get-Date -Format 'yyyy-MM-dd'
  }
  
  end {}
}