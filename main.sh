#!/usr/bin/env bash

for shfile in $(ls lib); do
  if [[ $shfile == *.sh ]]; then
    source ./lib/$shfile
  fi
done

echo "Setup ubuntu"

current_path=$(pwd)

header 'Base'
base

header 'Packages'
packages

header 'SSL'
confirm 'Add ssl for nginx?' && letsencrypt_ssl

cd current_path && rm -rf ubuntu-setup && cd ~/
