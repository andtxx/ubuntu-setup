#!/usr/bin/env bash

for shfile in $(ls lib); do
  if [[ $shfile == *.sh ]]; then
    source ./lib/$shfile
  fi
done

echo "Setup ubuntu"

header 'Base'
base

header 'Packages'
packages

header 'SSL'
confirm 'Add ssl for nginx?' && letsencrypt_ssl

cd .. && rm -rf ubuntu-setup
