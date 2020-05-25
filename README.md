# Setting up a new Mac for development

This is my personal setup for setting up a Mac for development. Suggestions welcome in issues. PRs less welcome unless you know me and are pretty sure I'd appreciate it :)

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

Install homebrew: https://brew.sh/
- `brew install git`
- `git clone https://github.com/iHiD/dotfiles.git ~/.dotfiles`
- `ln -s ~/.dotfiles/files/Brewfile ~/Brewfile`

Ensure everything is uncommented in the Brewfile then run:
- `cd ~ && brew bundle`

## MacVim

Don't install this from homebrew. Instead download the most recent DMG from https://github.com/macvim-dev/macvim/releases

# VIM

Let's get VIM setup:

`ln -s ~/.dotfiles/.vim ~/.vim`

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

## Ruby

- `ruby-install ruby`

Create a ruby version file using:
- `echo "ruby-2.7" > ~/.ruby-version`

## Javascript

`nvm` is installed via fisher. Run this to install node:

- `nvm use lts`

Then get the latest npm and install yarn.

- `npm install -g npm@latest`
- `npm install -g yarn`

## Prettier

I'm not 100% sure this is needed but I think it worked.
- `yarn global add prettier @prettier/plugin-ruby`

## Link misc dotfiles

- `ln -s ~/.dotfiles/files/.ssh_config ~/.ssh/config`

## Ngrok

Add the auth token from https://dashboard.ngrok.com/get-started/setup
