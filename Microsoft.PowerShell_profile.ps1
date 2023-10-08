Set-Alias -Name vim -Value nvim

# Show Terminal Icons
Import-Module -Name Terminal-Icons

# Import the PSReadline module
Import-Module PSReadline

# Customize tab completion behavior
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Only show folder, Not entire directory
function shorten-path([string] $path) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   # make path shorter like tabs in Vim,
   # handle paths starting with \\ and . correctly
   return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2')
}

function prompt {
   # our theme
   $cdelim = [consoleColor]::DarkBlue 
   $chost = [ConsoleColor]::Magenta
   $cloc = [ConsoleColor]::DarkBlue

#   write-host "$([char]0x0A7) " -n -f $cloc
   write-host ([net.dns]::GetHostName()) -n -f $chost
   write-host ' {' -n -f $cdelim
   write-host (shorten-path (pwd).Path) -n -f $cloc
   write-host '}' -n -f $cdelim
   return ' '
}

function winfetch {
    # Define the path to the script you want to execute
    $scriptPath = "C:\Users\jsana\Documents\PowerShell\Scripts\winfetch.ps1"

    # Use the & operator to execute the script
    & $scriptPath
}
