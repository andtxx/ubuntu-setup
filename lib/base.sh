function base {
  header 'Configure ssh'

  mkdir .ssh
  chmod 700 .ssh/
  ssh-keygen

  if confirm 'Add ssh key?'; then
    touch .ssh/authorized_keys
    chmod 600 .ssh/authorized_keys
    read -p 'Enter key: ' key
    echo "$key" >>.ssh/authorized_keys
  fi

  ssh_config_file='/etc/ssh/sshd_config'
  ssh_config=$(cat $ssh_config_file)
  sudo echo "${ssh_config/"# PermitRootLogin=yes"/PermitRootLogin=no}" >$ssh_config_file
  sudo service ssh restart

  header 'Configure firewall'

  sudo ufw enable
  sudo ufw limit 22
  sudo ufw allow 21
  sudo ufw allow 80
  sudo ufw allow 443
  sudo ufw reload
}
