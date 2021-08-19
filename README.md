# 色々な種類(予定)の設定ファイルまとめ
## 設定ファイル読み込み(Vim)

必要なもの

プラグイン管理はBundleを利用

GitBash(or Git) : ```git clone```, ```shellscript``` を使うため

Python3 : ```pip3```を使うため（```:echo has('python3'）```の出力が
```0```なること前提）

vim(64bit版) : たぶん香り屋のでもいけるんじゃないかな

### WINDOWS 基本こっちに最新の設定が書かれる

GitBashを起動します

``` git clone https://github.com/abava00/settings/```

``` cd settings```

``` sh install_win.sh```

gitbashを閉じる

vimを起動し```:PlugInstall```を実行


~/vimfiles 以下(ない場合はvimflesも生成する)にフォルダが生成されます

　

ぜんぶGitbashで終わらせるにはどうしたらいいんですかね
Gitbashのsh.exeへPATHを通せばできるのか...?

### LINUX

terminalを起動します

``` git clone https://github.com/abava00/settings/```

``` cd settings```

``` sh install_linux.sh```

~/.vim 以下(ない場合はvimflesも生成する)にフォルダが生成されます

※Linux のほうは拡張機能になにも書かれていません

ある意味ではプレーンなものが使えるからいいのかも(?) 


