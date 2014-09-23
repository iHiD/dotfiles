# My dotfiles
========

Clone to `~/dotfiles`

```
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/vim/.gvimrc ~/.gvimrc

mkdir ~/.vim
ln -s ~/dotfiles/vim/after ~/.vim/after
ln -s ~/dotfiles/vim/autoload ~/.vim/autoload
ln -s ~/dotfiles/vim/bundle ~/.vim/bundle
ln -s ~/dotfiles/vim/colors ~/.vim/colors
ln -s ~/dotfiles/vim/ftplugin ~/.vim/ftplugin
ln -s ~/dotfiles/vim/plugin ~/.vim/plugin

cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
```
