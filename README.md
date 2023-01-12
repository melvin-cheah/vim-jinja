# Fork for [Jinja for Vim](https://github.com/lepture/vim-jinja)

[@melvin-cheah](https://github.com/melvin-cheah) fork for:
* Background colour change on jinja code (set b:jinja_bg_color)
* Figure out file type from extension, e.g. an HTML template is *.jinja.html, and a SystemVerilog template is *.jinja.sv
  * Using output file type at end means other text editors will syntax highlight most of the code as usual
* Support all fileypes automatically (as long as there is already syntax highlighting for that filetype)

# Jinja for Vim

See [Jinja for Vim original project's](https://github.com/lepture/vim-jinja) README for full info.

[Jinja for Vim](https://github.com/lepture/vim-jinja) provides syntax highlighting and some indent support.

# Installation

## Install with [Vundle](https://github.com/gmarik/vundle)

    Plugin "melvin-cheah/vim-jinja"

And install it:

    :so ~/.vimrc
    :PluginInstall

## Install with [pathogen](https://github.com/tpope/vim-pathogen)

    cd ~/.vim/bundle
    git clone https://github.com/melvin-cheah/vim-jinja.git


# Bug report

## Original repo

Report a bug on [GitHub Issues](https://github.com/lepture/vim-jinja/issues).

## This fork

Report a bug on [GitHub Issues](https://github.com/melvin-cheah/vim-jinja/issues).

