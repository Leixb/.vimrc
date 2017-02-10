# .vimrc
My personal vim configuration, targeted at nvim and vim8.

## Installation
Follow the instructions bellow to install and the next time you open vim, vim-plug should download and install all the plugins.
### Vim
Clone this repository into `~/.vim` and soft link `~/.vimrc` to `~/.vim/init.vim`:

    git clone https://github.com/Leixb/.vimrc ~/.vim
    ln -s "~/.vim/init.vim" ~/.vimrc

### Neovim
Clone this repository to `$XDG_CONFIG_HOME/nvim`

    git clone https://github.com/Leixb/.vimrc "$XDG_CONFIG_HOME/nvim"

### Both Neovim and Vim
Clone the repository to `~/.vim` and link nvim to this folder:

    git clone https://github.com/Leixb/.vimrc ~/.vim
    ln -s "~/.vim/init.vim" ~/.vimrc
    ln -s "~/.vim/init.vim" ~/.vimrc
    ln -s ~/.vim "$XDG_CONFIG_HOME/nvim/"

