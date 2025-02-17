function prompt {
    $e = [char]0x1b;
    $str  = "$e[0;36mPS$e[0m ";
    $str += "$e[0;32m$env:USERNAME@$env:COMPUTERNAME$e[0m ";
    $str += "$e[0;36m$((Get-Location).Path)$e[0m";

    $branch = $(git branch --show-current 2>$null);
    if($branch -ne $null) {
        $str += " $e[0;33m($branch)$e[0m";
    }
    $str += "`n$e[0;36m$((history).length+1)>$e[0m ";
    return $str;
}

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}