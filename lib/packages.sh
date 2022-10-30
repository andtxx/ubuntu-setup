function packages {
  read -p 'Enter username for git: ' git_username
  read -p 'Enter email for git: ' git_email
  git config --global user.name "$git_username"
  git config --global user.email "$git_email"

  sudo apt update

  sudo apt install curl

  sudo apt install python3
  sudo apt install python3-pip

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  source ~/.bashrc
  nvm install --lts

  npm install pm2 -g

  sudo apt install vsftpd
  sudo systemctl stop vsftpd

  sudo apt install nginx

  sudo apt install postgresql postgresql-contrib
  sudo systemctl start postgresql.service
  sudo -u postgres createuser --interactive
  sudo -u postgres createdb $USER
  psql -c "\password"
}
