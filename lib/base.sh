function base {
  mkdir .ssh
  chmod 700 .ssh/
  ssh-keygen

  if confirm 'Add ssh key?'; then
    cd .ssh
    touch authorized_keys
    chmod 600 authorized_keys
    read -p 'Enter key: ' key
    echo "$key" >>authorized_keys
  fi

  sshConfigFile='/etc/ssh/sshd_config'
  sshConfig=$(cat $sshConfigFile)
  sudo echo "${sshConfig/"# PermitRootLogin=yes"/PermitRootLogin=no}" >$sshConfigFile
  sudo service ssh restart

  sudo ufw enable
  sudo ufw limit 22
  sudo ufw allow 21
  sudo ufw allow 80
  sudo ufw allow 443
  sudo ufw reload
}
