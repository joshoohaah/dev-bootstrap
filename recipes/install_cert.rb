
## Certs taken from \\filestore5.api-wi.com\Quality\Resources\Test Environment Files\Certificates

## Augustus Cert Chain
windows_certificate "#{Chef::Config['file_cache_path']}/cookbooks/dev-bootstrap/files/default/Augustus_CA_Chain_exp_2019_10_20.cer" do
    store_name 'ROOT'
    action :create
end

## Local Cert
windows_certificate "#{Chef::Config['file_cache_path']}/cookbooks/dev-bootstrap/files/default/localhost_SAN_Augustus_exp10_09_2018.pfx" do
    # cert_path "#{Chef::Config['file_cache_path']}/cookbooks/dev-bootstrap/files/default/localhost_SAN_Augustus_exp10_09_2018.pfx"
    store_name 'MY'
    # user_store true
    pfx_password 'Inn0vation'
    action :create
end


## TODO FIX cert binding to work for localhost. Below is the error
# ----
#     STDOUT: SSL Certificate add failed, Error: 1312
#     A specified logon session does not exist. It may already have been terminated.
#     STDERR:
# ---- End output of C:\Windows\system32\netsh.exe http add sslcert ipport=0.0.0.0:443 certhash=324b8631bce8f279c98ba65b7a77518f14439624 appid={4dc3e181-e14b-4a21-b022-59fc669b0914} certstorename=MY ----

# windows_certificate_binding "localhost" do
#     cert_name    "324b8631bce8f279c98ba65b7a77518f14439624"
#     name_kind    :hash
#     # store_name    "MY"
#     # port        4334
# end


# windows_certificate_binding "localhost" do
#     # cert_name  ssl_cert['thumbprint']
#     cert_name  '324b8631bce8f279c98ba65b7a77518f14439624'
#     name_kind  :hash
#     # store_name "MY"
#     # port        '443'
#     # action     :create
# end

