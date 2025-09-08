
# Nushell Config File
#
# version = "0.104.0"

use keybindings.nu keybindings
use theme.nu *
use ~/.cache/starship/init.nu
use bash-env.nu

source aliases.nu
source ~/.cache/zoxide/init.nu

$env.config = { 
    show_banner: false
    shell_integration: {
        # This is used to enable terminals to know where the prompt is, the command is, where the command finishes, and where the output of the command is
        # if true, the prompt will move automatically while input
        osc133: false
    }
    keybindings: $keybindings
    color_config: $dark_theme
}

$env.config.hooks.env_change.PWD = { ||
    if (which direnv | is-empty) {
        return
    }

    direnv export json | from json | default {} | load-env
}  
