# Fork for Jinja for Vim

@melvin-cheah fork for:
* Figure out file type from extension, e.g. an HTML template is *.jinja.html
  * Using output file type at end means other text editors will syntax highlight most of the code correctly
* Highlight jinja code
* Support all fileypes automatically (as long as there is already syntax highlighting for that filetype)

Original README below, edited with reference to this fork where needed

# Jinja for Vim

Jinja bundle for vim.

## Feature

1. full syntax support
2. great indent support

## Installation

### Install with [Vundle](https://github.com/gmarik/vundle)

If you are not using vundle, you really should have a try.
Edit your vimrc:

    Bundle "melvin-cheah/vim-jinja"

And install it:

    :so ~/.vimrc
    :BundleInstall


### Install with [pathogen](https://github.com/tpope/vim-pathogen)

If you prefer tpope's pathogen, that's ok. Just clone it:

    cd ~/.vim/bundle
    git clone https://github.com/melvin-cheah/vim-jinja.git


## Configuration

No configuration is needed, if you are using vim 7.2+, it will detect if
a html file is a jinja template.

But if you want to ensure it works well, you can edit your vimrc:

```vim
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
```


## Bug report

For the original repo:

Report a bug on [GitHub Issues](https://github.com/lepture/vim-jinja/issues).

For this fork:

Report a bug on [GitHub Issues](https://github.com/melvin-cheah/vim-jinja/issues).

