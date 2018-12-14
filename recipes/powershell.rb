
case node['platform_family']
when 'windows'
    include_recipe 'powershell::powershell5'

    powershell_script 'Register Default Repo' do
        code <<-EOH
        Register-PSRepository -Default
        Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
        EOH
        action :nothing
    end

    # TODO fix this method to have a 'guard' checking if PS Gallery is Trusted
    powershell_package_source 'PSGallery' do
        provider_name 'NuGet'
        publish_location 'https://www.powershellgallery.com/api/v2/package/'
        script_publish_location 'https://www.powershellgallery.com/api/v2/package/'
        script_source_location 'https://www.powershellgallery.com/api/v2/items/psscript/'
        url 'https://www.powershellgallery.com/api/v2'
        trusted true
        ignore_failure true
        action :register
        # notifies :run, 'powershell_script[Register Default Repo]', :before
    end

powershell_package 'Install Multiple Packages' do
    action :install
    package_name %w(AzureRM oh-my-posh posh-git posh-docker)
    end
else
    log 'Powershell does not deploy to non-windows machines' do
        level :info
    end
end
    