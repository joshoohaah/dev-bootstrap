include_recipe 'iis'

package "URL ReWrite2" do
  source "#{Chef::Config['file_cache_path']}/cookbooks/dev-bootstrap/files/default/rewrite_amd64_en-US.msi"
  action   :install
end

##  Package Resource Deploy model
## TODO FIX:  SocketError: Error connecting to http://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi - Failed to open TCP connection to download.microsoft.com:80 (getaddrinfo: No such host is known. )
# package node['dev-bootstrap']['iis']['url_rewrite']['package_name'] do
#   source   node['dev-bootstrap']['iis']['url_rewrite']['source']
#   action   :install
# end

## Chocolatey URLRewrite Deploy model. 
## TODO FIX  SocketError: Error connecting to http://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi - Failed to open TCP connection to download.microsoft.com:80 (getaddrinfo: No such host is known. )
# if node['platform_family'] == 'windows'
#     include_recipe 'chocolatey'
#     chocolatey_package 'urlrewrite' do
#         action :install
#     end
# else
# end
