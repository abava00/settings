# 色々な種類(予定)の設定ファイルまとめ
\
+ linux
    + .vim
       + vim関係のファイル
+ windows
    + nvimfiles
      + neovim関係のファイル(中身ほぼ無し)
    + vimfiles
      + vim関係のファイル
    + vscodefile
      + vscodeの同期がおかしくなった時の予備


## 設定ファイル読み込み(Vim)

必要なもの

プラグイン管理はBundleを利用

GitBash(or Git) : ```git clone```, ```shellscript``` を使うため

Python3 : ```pip3```を使うため（```:echo has('python3'）```の出力が
```1```なること前提） ここのやり方がいまいちわからないからどうにかしたいね

vim(64bit版) : たぶん香り屋のでもいけるんじゃないかな

### WINDOWS 基本こっちに最新の設定が書かれる

GitBashを起動します

``` git clone https://github.com/abava00/settings/```

``` cd settings```

``` sh install_win.sh```

gitbashを閉じる

vimを起動し```:PlugInstall```を実行
### LINUX

terminalを起動します

``` git clone https://github.com/abava00/settings/```

``` cd settings```

``` sh install_linux.sh```

~/.vim 以下(ない場合はvimflesも生成する)にフォルダが生成されます
