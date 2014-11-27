#!/usr/bin/env bash

sites=( "pinfinity_co" "cmisutah_com" )

fail () {
  echo "$@" >&2
  exit 1
}

main () {
  git_deploy_all_sites
  make_statamic_dirs
}

print_section () {
  local msg="$1"
  echo "************************************************************"
  echo "$msg"
  echo "************************************************************"
}

update_package_list () {
  print_section "Updating package list"
  sudo apt-get update
}

git_deploy_all_sites () {
  cd /vagrant/properties
  for i in "${sites[@]}"; do
    print_section "Deploying $i from github.com"
    sudo git clone "https://github.com/pinfinity/$i"
    sudo chown -R vagrant:vagrant "$i"
  done
}

make_statamic_dirs () {
  for i in "${sites[@]}"; do
    print_section "Making Statamic directories for $i"
    cd "/vagrant/properties/$i"
    mkdir _logs _cache
    chmod 777 _logs _cache
  done
}

main "$@"

