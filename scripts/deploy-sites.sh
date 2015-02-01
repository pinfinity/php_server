#!/usr/bin/env bash

sites=( "pinfinity_co" "cmisutah_com" )
# devSites=( "dev_cmisutah_com" )

fail () {
  echo "$@" >&2
  exit 1
}

main () {
  git_deploy_all_sites
  make_statamic_dirs
  symlink_dev_directories  
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

symlink_dev_directories () {
  print_section "symLink dev_ directories"
  for i in "${sites[@]}"; do
    sudo sudo ln -s /vagrant/properties/$i /vagrant/properties/dev_$i
  done  
}

git_deploy_all_sites () {
  #cd /vagrant/properties
  for i in "${sites[@]}"; do
    cd /vagrant/properties
    print_section "Deploying $i from github.com"
    sudo git clone "https://github.com/pinfinity/$i"
    cd $i
    for remote in `git branch -r`; do git branch --track $remote; done
    # for remote in `git branch -r`; do echo $remote; done
    # sudo git fetch --all
    sudo git pull --all
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

