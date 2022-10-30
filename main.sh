#!/usr/bin/env bash

dir="ubuntu-setup"

for shfile in $(ls "$dir/lib"); do
  if [[ $shfile == *.sh ]]; then
    source $dir/lib/$shfile
  fi
done

printf "\nSetup ubuntu"

base
packages
confirm 'Add ssl for nginx?' && letsencrypt_ssl

rm -rf $dir
