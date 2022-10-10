# 色々な種類(予定)の設定ファイルまとめ
## ファイルの内訳
- linux
  - bashrc  : エイリアス等の普段使いで便利になりそうな設定
  - inputrc : bashrcに記述すればそれで良さそうだけど参考にしたサイト(参考元忘却)でinputrcに置いていた気がするので置かれている設定
- emacsfiles
  - 設定ファイル
- nvimfiles
  - nvim      : 設定ファイル
  - nvim-data : 拡張機能の設定ファイル
- vimfiles
  - 設定ファイル
- vscodefiles
  - 設定ファイル
- starship
  - テーマ構築ファイル
- WindowsTerminal
  - 設定ファイル
- setup
  - コマンド1つでセットアップが行われるファイルたちが置かれる(未実装)
  - linux.sh

## 設定ファイル読み込み

none

### WINDOWS

none

### LINUX

このセットアップは、次のパッケージが導入されていることが前提に作られています。

`
curl  exa
`


#### このレポジトリをクローンする。

```
git clone https://github.com/abava00/settings
cd settings/setup
```

#### ShellScriptを実行する。

##### すべての設定をセットアップする場合
```
sh linux.sh
```

##### 特定の設定をセットアップする場合

セットアップしたい対象の名前を入れる

(複数の名前を引数に入れた場合は対応していません。)
```
sh linux.sh <vim/neovim/emacs/linux/starship>

ex) sh linux.sh vim
ex) sh linux.sh starship
```
