# ~/dotfiles/HOMELY.py
from os.path import expanduser

from homely.files import download, mkdir, symlink
from homely.install import installpkg
from homely.system import execute

mkdir('~/.vim/autoload')

symlink('_gitconfig', '.gitconfig')
symlink('_gitignore', '.gitignore')
symlink('_hgignore', '.hgignore')
symlink('_hgrc', '.hgrc')
symlink('_tmux.conf', '.tmux.conf')
symlink('_vimrc', '.vimrc')

# vim_plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# download(vim_plug_url, '~/.vim/autoload/plug.vim')

# mkdir('~/.config')
# mkdir('~/.config/nvim')
# mkdir('~/.config/pip')

# symlink('init.vim', '~/.config/nvim/')
# symlink('pip.conf', '~/.config/pip/')

installpkg('ag', yum='the_silver_searcher', apt='silversearcher-ag')
installpkg('tmux')

installpkg('zsh')

oh_my_zsh_url = 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
install_script = 'oh-my-zsh-install.sh'
download(oh_my_zsh_url, install_script)
home = expanduser('~')
execute(['sh', install_script], cwd=home)

nvm_url = 'https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh'
download(nvm_urL, install_script)

