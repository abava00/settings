
echo "hello"
cat ./windows/icon/windows.txt
echo "This script is setting file for windows"
read -p "Continue downloading?(y/N): " yn
case "$yn" in [yY]*) ;; *) echo "quited!." ; exit ;; esac

mkdir ~/vimfiles/
echo "mkdir ~/vimfiles/"
mkdir ~/vimfiles/.vim/
echo " ~/vimfiles/.vim/"
mkdir ~/vimfiles/.vim/bundle/
echo "~/vimfiles/.vim/bundle/"
cp ./windows/vimfiles/vimrc ~/vimfiles/
echo "./windows/vimfiles/vimrc ~/vimfiles/"
cp ./windows/vimfiles/gvimrc ~/vimfiles/
echo "./windows/vimfiles/gvimc ~/vimfiles/"
cp ./windows/vimfiles/vundlerc ~/vimfiles/
echo "./windows/vimfiles/vundlerc ~/vimfiles/"

git clone https://github.com/VundleVim/Vundle.vim.git ~/vimfiles/.vim/bundle/Vundle.vim

pip3 install --user pynvim

#vim +PluginInstall +qall
