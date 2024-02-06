alias rmd='rm -rf'
alias la='ls -lA --color=auto'
alias untar='tar -zxvf'
alias wget='wget -c'
alias install='sudo apt-get install'
alias upgrade='sudo apt-get upgrade'
alias update='sudo apt-get update'
alias www='py -m http.server'
alias pwww='php -S 127.0.0.1:8000'
alias ..='cd ..'
alias ...='cd  ../..'
alias ....='cd ../../..'
alias bashconfig='nano ~/.bashrc'

alias py='python3'
alias pip='pip3'
alias pipupg='pip install --upgrade pip'
alias pipupd='pip freeze --user | cut -d'=' -f1 | xargs -n1 pip install -U'
alias pipfreeze='pip freeze > requirements.txt'
alias pipinstall='pip install -r requirements.txt'
alias jup="jupyter-notebook --allow-root"

alias dev='source venv/bin/activate'

alias f='fzf'

alias ga='git add -A'
alias gc='git commit -m'
alias gpush='git push origin main'
alias gpull='git pull origin main'

alias pi='ssh pi@192.168.1.102'