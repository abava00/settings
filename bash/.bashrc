export PS1="[(’ω')っ\w]$ "
# export PS1="[\u@('ω')っ\w]$ "

alias ls="exa --icons"
alias la="ls -a"
#cat ~/Documents/vimascii
#cat ~/Documents/vimascii_color
#cat ~/Documents/test2
#cat ~/Documents/vimascii_color | echo -e $(cat)

# history timestamp
HISTTIMEFORMAT='%F %T '

# ruby install dir
export GEM_HOME=~/.config/ruby
export PATH=$PATH:~/.config/ruby/bin

# do not exit with <c-d>
set -o ignoreeof -f
