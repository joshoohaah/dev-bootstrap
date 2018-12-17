
default['iis']['components'] = %w(IIS-WebServerRole  IIS-WebServer IIS-CommonHttpFeatures IIS-HttpErrors IIS-HttpRedirect IIS-ApplicationDevelopment IIS-NetFxExtensibility IIS-NetFxExtensibility45 IIS-HealthAndDiagnostics IIS-HttpLogging IIS-LoggingLibraries IIS-RequestMonitor IIS-HttpTracing IIS-Security IIS-URLAuthorization IIS-RequestFiltering IIS-IPSecurity IIS-Performance IIS-HttpCompressionDynamic IIS-WebServerManagementTools IIS-StaticContent IIS-DefaultDocument IIS-DirectoryBrowsing IIS-WebSockets IIS-ApplicationInit IIS-ASPNET IIS-ASPNET45 IIS-ISAPIExtensions IIS-ISAPIFilter IIS-ServerSideIncludes IIS-CustomLogging IIS-BasicAuthentication IIS-HttpCompressionStatic IIS-ManagementConsole IIS-ManagementService IIS-CertProvider IIS-WindowsAuthentication IIS-DigestAuthentication IIS-ClientCertificateMappingAuthentication IIS-IISCertificateMappingAuthentication)

default['dev-bootstrap']['iis'].tap do |iis|
    # Browsers to Install
    iis['iis'] = %w()
    iis['url_rewrite']['package_name'] = 'IIS URL Rewrite Module 2'
    iis['url_rewrite']['source'] = 'http://download.microsoft.com/download/D/D/E/DDE57C26-C62C-4C59-A1BB-31D58B36ADA2/rewrite_amd64_en-US.msi'
end
