function Run-AsUser{
    param(
      [Parameter(Position = 0, Mandatory = $true)]
      [string]$script,
      [Parameter(Position = 1, Mandatory=$true)]
      [System.Management.Automation.PsCredential]$cred      
    )
    
    Start-Process -Credential $cred -FilePath 'powershell.exe' -ArgumentList '-noprofile','-Command',"$script"
}

#$cred = get-credential
#Run-AsUser "powershell.exe" $cred
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
            Write-Warning "This script should be ran with administrative priviliges."
