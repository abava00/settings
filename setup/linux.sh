#!/bin/sh
# testing on ubuntu
# initialize
arg=""
workdir=$(cd $(dirname $0);pwd)
cd $workdir


# linux
linux () {
  # add coufigure in bashrc
  if type "exa"; then
    echo "# Tab:menu-complete settting(Ubuntu?)" >> ~/.bashrc
    cat ../linux/.bashrc >> ~/.bashrc
  else
    echo "please install exa"
    exit 0
  fi
}

# emacs
emacs () {
  ln -iv ../emacsfiles/.emacs.d/init.el ~/.emacs.d/init.el
}

# neovim
neovim () {
  # add cunfigure in bashrc
  echo "# neovim config" >> ~/.bashrc 
  echo "export XDG_CONFIG_HOME=~/.config" >> ~/.bashrc 
  # make nvim file
  mkdir -p ~/.config/nvim/plugged
  mkdir -p ~/.config/nvim/undodir
  # make hardlink
  ln -iv ../nvimfiles/nvim/init.vim ~/.config/nvim/init.vim
  ln -iv ../nvimfiles/nvim/ginit.vim ~/.config/nvim/ginit.vim
  ln -iv ../nvimfiles/nvim-data/plugrc ~/.config/nvim/plugrc
  ln -iv ../nvimfiles/nvim-data/plugged/nvim-cmp ~/.config/nvim/plugged/nvim-cmp
  ln -iv ../nvimfiles/nvim-data/plugged/trouble ~/.config/nvim/plugged/trouble
  # adfd plugin manager
  if type "curl"; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  else
    echo "please install curl"
    exit 0
  fi
}

# vim
vim () {
  ## make .vim file
  mkdir -p ~/.vim/plugin
  mkdir -p ~/.vim/undodir
  ## make hardlink
  ln -iv ../vimfiles/vimrc ~/.vim/vimrc
  ln -iv ../vimfiles/gvimrc ~/.vim/gvimrc
  ln -iv ../vimfiles/vundlerc ~/.vim/vundlerc
  ln -iv ../vimfiles/plugin/InThisWord.vim ~/.vim/plugin/InThisWord.vim
  ## install plugin manager 
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

# starship 
starship () {
  ## install starship
  if type "curl"; then
    echo "install staship"
    cd /tmp/
    curl -sS https://starship.rs/install.sh | sh
    cd $workdir
  else
    echo "please install curl"
    exit 0
  fi
  ## make starship configure file
  mkdir -p ~/.config/starship
  ## make hardlink
  ln -iv ../starship/starship.toml ~/.config/starship/starship.toml
  ## add configuer in bashrc
  echo "# starship config" >> ~/.bashrc
  echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
  echo "export STARSHIP_CONFIG=~/.config/starship/starship.toml" >> ~/.bashrc
}

# main
## arg check
if [ $# -eq 0 ]; then
  arg="all"
  linux
  emacs
  neovim
  vim
  starship
elif [ $# -eq 1 ]; then
  case $1 in
    "linux" ) linux ;;
    "emacs" ) emacs ;;
    "neovim" ) neovim ;;
    "vim" ) vim ;;
    "starship" ) starship ;;
  esac
else
  echo "this scrip accepts only 0 or 1 arg"
  exit 0
fi

exit 0
