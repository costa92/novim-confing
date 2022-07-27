# neovim config


## 安装 vim-plug 的脚本：

参考: https://github.com/junegunn/vim-plug
linux
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
              https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 安装 YouCompleteMe

1. 安装golang
```sh
cd ~/.config/nvim/plugged/YouCompleteMe  
git pull
git submodule update --init --recursive --init
// 安装 golang
 ./install.sh --clang-completer --go-completer
```

2.安装全部
```sh
cd ~/.config/nvim/plugged/YouCompleteMe
git pull
./install.sh --all
```
