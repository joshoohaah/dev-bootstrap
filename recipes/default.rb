#
# Cookbook:: dev-bootstrap
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Some chef dependencies written in ruby need this to run in kitchen...
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

## TODO FIX java recipe to work
# include_recipe 'dev-bootstrap::install_java'

# include_recipe 'dev-bootstrap::powershell'

# include_recipe 'dev-bootstrap::install_vscode'

# include_recipe 'dev-bootstrap::iis'

# include_recipe 'dev-bootstrap::install_browsers'

include_recipe 'dev-bootstrap::install_cert'
