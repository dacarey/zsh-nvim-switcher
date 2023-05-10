# zsh-nvim-switcher
A zsh plugin to manage switching of neovim distributions,  such as [LazyVim](https://www.lazyvim.org/),   [kickstart](https://github.com/nvim-lua/kickstart.nvim) as well as a plain old roll your own configuration.

## Install
Using the [:zap: Zap](https://www.zapzsh.org/) minimal zsh plugin manager, add the following to your `.zshrc`

```sh
# Install plugin
plug "dacarey/zsh-nvim-switcher"
```

## Prerequisite Checks
A check will be performed to verify that a default neovim configuration is present.

## Kudos
This plugin is entirely based on Elijah Manor's [.zshrc](https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b) file and his excellent associated [Neovim Config Switcher - YouTube video](https://youtu.be/LkHjJlSgKZY).

And of course, huge thanks to the Neovim development team for adding the [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME) feature in the [Neovim 0.9 release](https://neovim.io/doc/user/news-0.9.html#news-0.9)

