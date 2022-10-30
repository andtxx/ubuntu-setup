function packages {
  header 'Configure git'

  read -p 'Enter username for git: ' git_username
  read -p 'Enter email for git: ' git_email
  git config --global user.name "$git_username"
  git config --global user.email "$git_email"

  header 'Install curl & ftp & nginx & python'

  sudo apt update
  sudo apt install curl
  sudo apt install vsftpd
  sudo apt install nginx
  sudo apt install python3
  sudo apt install python3-pip

  header 'Install node & pm2'

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  nvm_dir="$HOME/.nvm"
  [ -s "$nvm_dir/nvm.sh" ] && \. "$nvm_dir/nvm.sh"
  [ -s "$nvm_dir/bash_completion" ] && \. "$nvm_dir/bash_completion"

  nvm install --lts

  npm install pm2 -g

  header 'Install & configure postgresql'

  sudo apt install postgresql postgresql-contrib
  sudo systemctl start postgresql.service
  sudo -u postgres createuser $USER -s --password
  sudo -u postgres createdb $USER
}
