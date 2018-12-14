#
# Cookbook Name:: workstation
# File:: java.rb
#


### Java install ###
default['java']['jdk_version'] = '8'
default['java']['accept_license_agreement'] = true
default['java']['set_default'] = true