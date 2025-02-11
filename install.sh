#!/bin/bash

echo 'updating'
sudo apt-get update
echo 'upgrading'
sudo apt-get upgrade -y
echo 'installing softwares'
sudo apt-get install -y python3 python3-dotenv python3-pip git zip unzip software-properties-common fzf neovim rsync gcc
sudo snap install nvim --classic
echo 'configuring git'
git config --global user.name "pixz"
git config --global init.defaultBranch main
git config --global user.email "pixz.dev@gmail.com"
git config --global alias.d diff
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.ca "commit -a"
git config --global alias.st status
git config --global alias.ba "branch -a"
git config --global alias.br branch
git config --global alias.bm "branch --merged"
git config --global alias.bn "branch --no-merged"
git config --global alias.hist "log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all"
git config --global alias.llog "log --graph --name-status --pretty=format:\"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset\" --date=relative"
git config --global alias.type "cat-file -t"
git config --global alias.dump "cat-file -p"

git remote remove origin
git remote add origin git@github.com:Pixz/dotfiles

echo 'installing pip general packages'
pip install virtualenv requests python-dotenv discord

echo 'creating ssh key'
# ssh-keygen -m PEM -t rsa -b 4096
cat ~/.ssh/id_rsa.pub | clip.exe
echo 'ssh pub key copied to clipboard'
read -p "Copy ssh key into github account, press Enter to continue"

curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | bash
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

rsync -a ./sources/ ~/
SH="${HOME}/.bashrc"

if grep -Fxq "functions.sh" ~/.bashrc; then
	for file in ~/.bash_custom/*; do
		if [ -f "$file" ]; then
			filename=$(basename "$file")
			echo "source ~/.bash_custom/"$filename"" >>"$SH"
		fi
	done
else
	echo "nothing to add"
fi

tmux source-file ~/.tmux.conf
bash -c "$(cd .. && rm -rf ../dotfiles/)"
exec bash --login
