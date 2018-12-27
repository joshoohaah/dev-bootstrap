
mount 'T:' do
    device "\\\\wiastorserv2.api-wi.com\\FS5\\Databases\\Microsoft SQL Server 2012\\ISO\\en_sql_server_2012_developer_edition_with_service_pack_4_x64_dvd_11455847"
    # fstype 'device'
    action :mount
end

# windows_package 'package_name' do
#     action :install
# end

windows_feature 'NET-Framework-Features' do
    action :install
end
windows_feature 'NET-Framework-Core' do
    action :install
end
# # "NET-Framework-Features, NET-Framework-Core

# sql_server_install 'Install SQL Server 2012 Developer' do
#   source_url 'T\\setup.exe'
#   version '2012'
# #   package_checksum '0FE903...420E8F'
#   sql_reboot false
#   accept_eula true
#   instance_name 'MSSQLSERVER'
# #   feature %w(SQLENGINE IS RS SSMS ADV_SSMS)
# end
