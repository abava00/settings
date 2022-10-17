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
  cd $workdir
}

# emacs
emacs () {
  ln -iv ../emacsfiles/.emacs.d/init.el ~/.emacs.d/init.el
  cd $workdir
}

# neovim latest
neovim_latest () {
  ## check installed nvim 
  # if type "nvim"; then
  #   echo "please uninstall neovim"
  #   exit 0 
  # fi

  ## add cunfigure in bashrc
  echo "# neovim config" >> ~/.bashrc 
  echo "export XDG_CONFIG_HOME=~/.config" >> ~/.bashrc 
  echo "export VIMRUNTIME=/usr/local/share/nvim/nvim/runtime" >> ~/.bashrc
  ## donwload from github
  cd /tmp/
  wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz
  tar -vxzf nvim-linux64.tar.gz
  cd nvim-linux64
  ## put nvims lib and share file
  echo "sudo cp nvim /usr/local/bin/nvim    and put file /usr/local/{lib, share}"
  sudo cp -r bin/nvim /usr/local/bin/nvim
  sudo cp -r lib/nvim /usr/local/lib/
  sudo mkdir /usr/local/share/nvim
  sudo cp -r share/* /usr/local/share/nvim/
  
  cd $workdir
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
  # add plugin manager
  if type "curl"; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  else
    echo "please install curl"
    exit 0
  fi
  cd $workdir
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
  cd $workdir
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
  cd $workdir
}

update () {
  cd $workdir
  echo "replace your setting files"
  if type "vim"; then
    ln -iv ../vimfiles/vimrc ~/.vim/vimrc
    ln -iv ../vimfiles/gvimrc ~/.vim/gvimrc
    ln -iv ../vimfiles/vundlerc ~/.vim/vundlerc
    ln -iv ../vimfiles/plugin/InThisWord.vim ~/.vim/plugin/InThisWord.vim
  elif type "emacs"; then
    ln -iv ../emacsfiles/.emacs.d/init.el ~/.emacs.d/init.el
  elif type "nvim"; then
    if [ -e "/usr/local/bin/nvim" ]; then
      ln -iv ../nvimfiles/nvim-latest/init.vim ~/.config/nvim/init.vim
    elif
      ln -iv ../nvimfiles/nvim/init.vim ~/.config/nvim/init.vim
      ln -iv ../nvimfiles/nvim/ginit.vim ~/.config/nvim/ginit.vim
      ln -iv ../nvimfiles/nvim-data/plugrc ~/.config/nvim/plugrc
    fi
  elif type "starship"; then
    ln -iv ../starship/starship.toml ~/.config/starship/starship.toml
  fi
  cd $workdir
}


# all
all () {
  linux
  emacs
  neovim
  neovim_latest
  vim
  starship
}

# help
help () {
  echo "this script is follow these option"
  echo ""
  echo "sh linux.sh all"
  echo "sh linux.sh linux"
  echo "sh linux.sh emacs"
  echo "sh linux.sh neovim"
  echo "sh linux.sh neovim_latest   (v0.8.0)"
  echo "sh linux.sh vim"
  echo "sh linux.sh starship"
  echo ""
  echo "sh linux.sh update    (replace newest setting hardlink file)"
}

# main
## arg check
if [ $# -eq 0 ]; then
  help
elif [ $# -eq 1 ]; then
  case $1 in
    "all" ) all ;;
    "linux" ) linux ;;
    "emacs" ) emacs ;;
    "neovim" ) neovim ;;
    "neovim_latest" ) neovim_latest ;;
    "vim" ) vim ;;
    "starship" ) starship ;;
    "help" ) help ;;
    "update" ) update ;;
  esac
else
  echo "this scrip accepts only 0 or 1 arg"
  exit 0
fi

exit 0
