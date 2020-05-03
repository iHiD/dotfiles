## Chrome

Download, login. Get the order of accounts right.

## 1Password

Download, configure. Phone required.

## ssh

Generate a key, add it to keychain, and put it on the clipboard:

- `ssh-keygen -t rsa`
- `ssh-add -K ~/.ssh/id_rsa`
- `pbcopy < ~/.ssh/id_rsa.pub`

Then paste it into GitHub.

## Homebrew

Firstly, we need Homebrew to manage dependencies.

In the dotfiles we have a Brewfile. We need to install brew, install git, clone the dotfiles repo, then run the brewfile.

- Install homebrew: https://brew.sh/
- `brew install git`
- `git clone https://github.com/iHiD/dotfiles.git ~/.dotfiles`
- `ln -s ~/.dotfiles/files/Brewfile ~/Brewfile`
- `cd ~ && brew bundle`

## Git

Configure Git correctly (it was installed in the step above)

- `ln -s ~/.dotfiles/files/.gitconfig ~/.gitconfig`
- `ln -s ~/.dotfiles/files/.gitignore_global ~/.gitignore_global`
- `git config --global core.excludesfile ~/.gitignore_global`

## Terminal

Load iHiD terminal from dotfiles:/files

## Fish

Fish will be installed via Homebrew. Run these to make it default:

- `echo /usr/local/bin/fish | sudo tee -a /etc/shells`
- `chsh -s /usr/local/bin/fish`
- `ln ~/.dotfiles/files/config.fish ~/.config/fish/config.fish`

Install fisher:

- `curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish`
- `ln -s ~/.dotfiles/files/fishfile ~/.config/fish/fishfile`
- `fish -c fisher`

Set correct colours for ls:
`set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD`

## Alfred

Download: https://www.alfredapp.com/

## Visual Studio Code

- Install from https://code.visualstudio.com/
- Install settings sync: https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync&ssr=false#overview
- [Option/Shift/D] to sync settings from https://gist.github.com/iHiD/55c8ceaebfeef15f0c5ee704e984d69bW

## Ruby

- `ruby-install ruby`

Create a ruby version file using:
`echo "ruby-2.7" > ~/.ruby-version`

## Javascript

`nvm` is installed via fisher. Run this to install node:

- `nvm use lts`

Then get the latest npm and install yarn.

- `npm install -g npm@latest`
- `npm install -g yarn`

## Prettier

I'm not 100% sure this is needed but I think it worked.
`yarn global add prettier @prettier/plugin-ruby`
