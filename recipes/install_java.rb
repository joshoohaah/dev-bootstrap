if node['platform_family'] == 'windows'
  # node.default['chocolatey']['install_vars']['chocolateyProxyLocation'] = ENV['http_proxy']
  include_recipe 'chocolatey'

  # TODO: Pin java to a known good version and allow upgrades only when changes.
  chocolatey_package 'javaruntime' do
    action :install
  end

else
  include_recipe 'java'
end
