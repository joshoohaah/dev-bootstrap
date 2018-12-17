if node['platform_family'] == 'windows'
    include_recipe 'chocolatey'
    chocolatey_package 'dotnetcore-sdk' do
        action :install
    end
else
end
