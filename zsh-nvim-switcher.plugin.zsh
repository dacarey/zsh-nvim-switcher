#!/usr/bin/env zsh

# Default logging mechanism (fallback to echo)
if ! typeset -f log_message >/dev/null 2>&1; then
    log_message() {
        echo "$1"
    }
fi

# Neovim configuration paths
NVIM_CONFIG_DIR="$HOME/.config/nvim"
INIT_LUA="$NVIM_CONFIG_DIR/init.lua"
INIT_VIM="$NVIM_CONFIG_DIR/init.vim"

# Check for Neovim configuration files
if [[ ! -e $INIT_LUA && ! -e $INIT_VIM ]]; then
    log_message "Error: Neither init.lua nor init.vim found in $NVIM_CONFIG_DIR"
    return
fi

log_message "==> ZAP PLUGIN loading - zsh-nvim-switcher"

if command -v nvim >/dev/null 2>&1; then
    log_message "    -- NVIM is configured to use $(which nvim)."
    log_message "    -- NVIM_APPNAME is set to ==> '$NVIM_APPNAME'"
fi

# Aliases for different Neovim configurations
alias nvim-lazy="NVIM_APPNAME=lazyvim nvim"
alias nviml="NVIM_APPNAME=lazyvim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvimk="NVIM_APPNAME=kickstart nvim"

# Function to select Neovim configuration
function nvims() {
    items=("default" "kickstart" "lazyvim")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    if [[ -z $config ]]; then
        log_message "Nothing selected"
        return 0
    elif [[ $config == "default" ]]; then
        config=""
    fi
    NVIM_APPNAME=$config nvim $@
    log_message "Selected NVIM configuration: $config"
}

# Bind a key for quick access to nvims
bindkey -s ^a "nvims\n"
