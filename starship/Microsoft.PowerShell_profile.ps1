if ($env:WT_PROFILE_ID) {
    # Windows Terminalから実行されたときだけ変更する設定をここに記述する
    #Import-Module posh-git
    # Set-PoshPrompt Paradox
    # Set-PoshPrompt -Theme agnosterplus
    # テーマ名.omp.jsonを書く
    # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\agnosterplus.omp.json" | Invoke-Expression
    # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
    # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\mytheme.omp.json" | Invoke-Expression
    # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\atomic.omp.json" | Invoke-Expression
    Invoke-Expression (&starship init powershell)
    $ENV:STARSHIP_CONFIG = "$HOME\prompt\starship.toml"
}
