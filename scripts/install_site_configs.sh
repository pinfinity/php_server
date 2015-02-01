#!/usr/bin/env bash

sites=( "cmisutah_com" "dev_cmisutah_com" "pinfinity_co" )

fail () {
  echo "$@" >&2
  exit 1
}

main () {
  configure_php5fpm
  configure_nginx
  restart_services
}

print_section () {
  local msg="$1"
  echo "************************************************************"
  echo "$msg"
  echo "************************************************************"
}

configure_php5fpm () {
  print_section "Configure PHP5 FPM"
  if [ ! -d /var/run/php5-fpm ]; then
    echo "ok"
  fi
  #for i in $sites; do
  for i in "${sites[@]}"; do
    sudo cp "/vagrant/configs/$i/$i.conf" "/etc/php5/fpm/pool.d/$i.conf"
  done
}

configure_nginx () {
  print_section "Configure Nginx"
  ( sudo cp /vagrant/configs/nginx.conf /etc/nginx/nginx.conf \
    && sudo cp /vagrant/configs/nginx_default /etc/nginx/sites-available/default ) \
    || fail "Unable to copy Nginx config files."
  #for i in $sites; do
  for i in "${sites[@]}"; do
    echo $i
    sudo cp "/vagrant/configs/$i/$i" "/etc/nginx/sites-enabled/"
  done
}

restart_services () {
  print_section "Restart services"
  sudo service php5-fpm restart
  sudo service nginx restart
}

main "$@"
