#!/usr/bin/env bash

# install homebrew
command -v brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install dotfiles
brew install vim
brew install git
brew install nvm

. $(brew --prefix nvm)/nvm.sh
nvm use 4
nvm alias default 4

while [[ $# > 0 ]]
do
  key="$1"

  case $key in
    -g|--gui)
      brew install caskroom/cask/brew-cask
      brew cask install google-chrome
      brew cask install google-drive
      brew cask install mailbox
      brew cask install filezilla
      brew cask install skype
      brew cask install flux
      brew cask install slack
      brew cask install appcleaner
      brew cask install anki
      open -a "Google Chrome" --args --make-default-browser
      shift # past argument
      ;;
    -d|--development)
      brew install mongodb
      # echo in red
      tput setaf 1
      echo "setting git config;; change if you arn't frederik"
      # stop echoing in red
      tput sgr0
      git config --global user.name "Frederik Dudzik"
      git config --global user.email frederik.dudzik@gmail.com 
      ssh-keygen -t rsa -b 4096 -C "frederik.dudzik@gmail.com" 
      eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa 
      pbcopy < ~/.ssh/id_rsa.pub
      echo 'copied key to clipboard. opening github settings.'
      echo 'Press [Enter] key when added key to github'
      sleep 2
      open https://github.com/settings/ssh
      read -p ''
      echo "npm"
      npm adduser doodzik
      shift # past argument
      ;;
  esac
  shift # past argument or value
done

git submodule update --init --recursive

# install ohmyzsh
command -v zsh >/dev/null 2>&1 || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# login into zsh
exec zsh -l
