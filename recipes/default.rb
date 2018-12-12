#
# Cookbook:: dev-bootstrap
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Some chef dependencies written in ruby need this to run in kitchen...
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# include_recipe 'dev-bootstrap::java'

include_recipe 'dev-bootstrap::powershell'