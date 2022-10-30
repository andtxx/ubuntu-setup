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

  config_path='/etc/ssh/sshd_config'
  config=$(cat $config_path)
  sudo echo "${config/"# PermitRootLogin=yes"/PermitRootLogin=no}" >sshd_config
  sudo mv sshd_config config_path
  sudo service ssh restart

  header 'Configure firewall'

  sudo ufw enable
  sudo ufw limit 22
  sudo ufw allow 21
  sudo ufw allow 80
  sudo ufw allow 443
  sudo ufw reload
}
