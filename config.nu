
# Nushell Config File
#
# version = "0.104.0"

use keybindings.nu keybindings
use theme.nu *
use bash-env.nu

source aliases.nu

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

$env.config.hooks.env_change.PWD = (
    try {$env.config.hooks.env_change.PWD} catch { [] } | append (source direnv.nu)
)

# starship enable
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
