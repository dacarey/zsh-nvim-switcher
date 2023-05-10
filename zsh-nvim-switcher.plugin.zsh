#!/usr/bin/env zsh
NVIM_CONFIG_DIR="$HOME/.config/nvim"
INIT_LUA="$NVIM_CONFIG_DIR/init.lua"
INIT_VIM="$NVIM_CONFIG_DIR/init.vim"

if [[ ! -e $INIT_LUA && ! -e $INIT_VIM ]]; then
    echo "Error: Neither init.lua nor init.vim found in $NVIM_CONFIG_DIR" 
    return
fi
echo "==> PLUGIN loaded zsh-nvim-switcher"

alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" )
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
  echo NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"
