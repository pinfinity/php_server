#!/usr/bin/env bash

fail () {
  echo "$@" >&2
  exit 1
}

main () {
 make_folder_array
}

print_section () {
  local msg="$1"
  echo "************************************************************"
  echo "$msg"
  echo "************************************************************"
}

make_folder_array () {
  # create an array with all the filer/dir inside ~/myDir
  names=(~/Projects/php_server/configs/*/)
  basenames=( "${names[@]#*/}")

  # iterate through array using a counter
  for dir in "${basenames[@]}"; do
      #do something to each element of array
      echo "$dir"
  done

  PS3='Please enter your choice: '
  options=("Option 1" "Option 2" "Option 3" "Quit")
  select opt in "${options[@]}"
  do
      case $opt in
          "Option 1")
              echo "you chose choice 1"
              ;;
          "Option 2")
              echo "you chose choice 2"
              ;;
          "Option 3")
              echo "you chose choice 3"
              ;;
          "Quit")
              break
              ;;
          *) echo invalid option;;
      esac
  done
}

# install_tools () {
#   print_section "Installing good-to-have packages"
#   sudo apt-get install -y \
#     build-essential \
#     git-core \
#     vim \
#     curl \
#     ack-grep \
#     wget \
#     tree \
#     zip \
#     unzip \
#     || fail "Unable to install tools."
# }

#install_apt_add () {
#  print_section "Installing apt-add-repository"
#  sudo apt-get install -y python-software-properties || fail "Unable to install python-software-properties"
#}

#add_nginx_repo () {
#  print_section "Adding ppa:nginx/stable"
#  sudo apt-add-repository -y ppa:nginx/stable || fail "Unable to install Nginx repo"
#}

# update_package_list () {
#   print_section "Updating package list"
#   sudo apt-get update
# }

# install_nginx () {
#   print_section "Installing nginx"
#   sudo apt-get install -y nginx || fail "Unable to install Nginx"
# }

# install_php5_fpm () {
#   print_section "Installing PHP5 FPM"
#   sudo apt-get install -y \
#     php5 \
#     php5-fpm \
#     php5-common \
#     php5-dev \
#     php5-gd \
#     php5-xcache \
#     php5-mcrypt \
#     php5-pspell \
#     php5-snmp \
#     php5-xsl \
#     php5-imap \
#     php5-geoip \
#     php5-curl \
#     php5-cli \
#     || fail "Unable to install PHP5 FPM"
# }

# clean_up_packages () {
#   print_section "Cleaning up packages"
#   (sudo apt-get autoremove -y && sudo apt-get autoclean -y) || fail "Unable to clean up packages"
# }

# install_bash_profile () {
#   print_section "Installing .bash_profile"
#   cp /vagrant/configs/.bash_profile /home/vagrant/.bash_profile
#   chown vagrant:vagrant /home/vagrant/.bash_profile
# }

# configure_php5fpm () {
#   print_section "Configure PHP5 FPM"
#   if [ ! -d /var/run/php5-fpm ]; then
#     sudo mkdir /var/run/php5-fpm || fail "Unable to create /var/run/php5-fpm"
#   fi
#   ( sudo cp /vagrant/configs/default_nginx.conf /etc/php5/fpm/pool.d/default_nginx.conf \
#     && sudo cp /vagrant/configs/index.php /usr/share/nginx/html/index.php ) \
#     || fail "Unable to copy PHP FPM config files."
# }

# configure_nginx () {
#   print_section "Configure Nginx"
#   ( sudo cp /vagrant/configs/nginx.conf /etc/nginx/nginx.conf \
#     && sudo cp /vagrant/configs/nginx_default /etc/nginx/sites-available/default ) \
#     || fail "Unable to copy Nginx config files."
# }

# restart_services () {
#   print_section "Restart services"
#   sudo service php5-fpm restart
#   sudo service nginx restart
# }

main "$@"

