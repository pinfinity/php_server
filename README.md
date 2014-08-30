# PHP Server Setup for Pinfinity Projects

## Setup a Remote Box
- Provision a box from Digital Ocean.
- Get the users and SSH configs setup. The instructions for this are roughly the same as those used for [JFDI](https://github.com/FireworksProject/jfdi/blob/master/docs/create-remotebox.md).
- Create a `/vagrant` directory with vagrant user ownership.
- Deploy the setup scripts with `scripts/manage deploy_configs vagrant@php.pinfinity.co`.
- Login to the remote machine and run `/vagrant/scripts/setup.sh`.

After the machine is set up, you should be able to get both http://php.pinfinity.co and http://php.pinfinity.co/index.php test pages to work.

## Install Property/Site Configurations
To install the configs for each property on this server, run

    /vagrant/scripts/install_site_configs.sh

on the remote machine.

To add a new property to the config list, edit the `sites` array at the top of the `install_site_configs.sh` script.


Copyright (c) 2014 by Pinfinity Consulting LLC