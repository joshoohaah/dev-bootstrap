
windows_package 'Microsoft SQL Server Compact 3.5 SP1 English' do
    installer_type :msi
    source "#{Chef::Config['file_cache_path']}/cookbooks/dev-bootstrap/files/default/SSCERuntime-ENU-x86.msi"
    options "/passive /quiet"
    action :install
end
