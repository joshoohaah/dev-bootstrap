
## Certs taken from \\filestore5.api-wi.com\Quality\Resources\Test Environment Files\Certificates

## Augustus Cert Chain
windows_certificate "#{Chef::Config['file_cache_path']}/cookbooks/dev-bootstrap/files/default/Augustus_CA_Chain_exp_2019_10_20.cer" do
    store_name 'ROOT'
    action :create
end

## Local Cert
windows_certificate "local-api.testing" do
    cert_path "#{Chef::Config['file_cache_path']}/cookbooks/dev-bootstrap/files/default/localhost_SAN_Augustus_exp10_09_2018.pfx"
    # store_name 'ROOT'
    user_store true
    pfx_password 'Inn0vation'
    action :create
end

# windows_certificate_binding "Local Cert Binding" do
#     cert_name  ssl_cert['thumbprint']
#     name_kind  :hash
#     store_name node['dcar_iis']['store_name']
#     port       protocol['port']
#     action     :create
# end
 