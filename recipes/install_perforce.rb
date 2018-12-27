if node['platform_family'] == 'windows'
    include_recipe 'chocolatey'
    node['dev-bootstrap']['apps']['perforce'].each do |browser|
        chocolatey_package browser do
            ignore_failure true
            action :install
        end
    end
else
end
