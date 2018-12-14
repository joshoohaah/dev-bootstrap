
# # This recipie installs Visual Studio Code.
# #

vs_code_dir = if node['platform'] == 'windows'
                "#{ENV['APPDATA']}/Code/User"
              else
                "/home/#{node['user_name']}/.config/Code/User"
              end

# # Create this first to make sure it's the correct owner.
directory vs_code_dir do
  recursive true
  mode '0777'
  owner node['user_name'] if platform_family?('debian', 'rhel')
  group node['group_name'] if platform_family?('debian', 'rhel')
  action :create
end

case node['platform_family']
when 'windows'
  chocolatey_package 'visualstudiocode' do
    action :install
    options '--allow-empty-checksums --ignore-checksums'
  end
end
# TODO FIXME
template "#{vs_code_dir}/settings.json" do
  source 'settings.json.erb'
  owner node['user_name'] if platform_family?('debian', 'rhel')
  group node['group_name'] if platform_family?('debian', 'rhel')
  mode '0755'
  variables(
    proxy: node['dev-bootstrap']['vscode']['proxy'],
    strict_ssl: node['dev-bootstrap']['vscode']['strict_ssl']
  )
  action :create_if_missing


end


# # TODO: Make this work
# # Windows seems to freeze on the install - possibly the window opens.
# # Ubuntu keeps getting directories in the home folder owned by root.
# # log 'Skip vscode extensions install for now!'
# # return

if platform_family?('windows')
  current_path = ENV['Path'].to_s
  env 'PATH' do
    action :modify
    value 'C:\\Program Files\\Microsoft VS Code\\bin'
    delim ';'
    not_if { current_path.include? 'Code' }
  end
  log "Path= #{ENV['PATH']}"
end

updated_path = 'C:\\Program Files\\Microsoft VS Code\\bin'

code_path = value_for_platform_family(
  'windows'  => '',
  'debian'   => '',
  'rhel'     => ''
)
node['dev-bootstrap']['vscode']['plugins'].each do |plugin|
  execute "Install Plugin : #{plugin}"  do
    live_stream true
    timeout 40
    command "code --install-extension #{plugin} --force"
    not_if <<-EOH
      $InstalledExtensions= code --list-extensions
      $InstalledExtensions -contains "#{plugin}"
    EOH
  end
end

# execute 'VSCode Extension Chef' do
#   command "#{code_path}code --install-extension Pendrica.Chef"
#   environment 'PATH' => "#{updated_path};#{ENV['PATH']}" if platform_family?('windows')
#   not_if <<-EOH
#     $InstalledExtentions= code --list-extensions
#     $a -contains "Pendrica.chef"
#   EOH
# end

# execute 'VSCode Extension Spell Check' do
#   command "#{code_path}code --install-extension streetsidesoftware.code-spell-checker"
#   user node['user_name'] if platform_family?('debian', 'rhel')
# #   not_if "#{code_path}code --list-extensions|grep -i streetsidesoftware.code-spell-checker"
# end

# execute 'VSCode Extension C++' do
#   command "#{code_path}code --install-extension ms-vscode.cpptools"
#   user node['user_name'] if platform_family?('debian', 'rhel')
# #   not_if "#{code_path}code --list-extensions|grep -i ms-vscode.cpptools"
# end

# execute 'VSCode Extension Perforce' do
#   command "#{code_path}code --install-extension slevesque.perforce"
#   user node['user_name'] if platform_family?('debian', 'rhel')
# #   not_if "#{code_path}code --list-extensions|grep -i slevesque.perforce"
# end

# # execute 'VSCode Extension CMake' do
# #   command "#{code_path}code --install-extension twxs.cmake"
# #   user node['user_name'] if platform_family?('debian', 'rhel')
# # #   not_if "#{code_path}code --list-extensions|grep -i twxs.cmake"
# # end

# execute 'VSCode Extension Python' do
#   command "#{code_path}code --install-extension ms-python.python"
#   user node['user_name'] if platform_family?('debian', 'rhel')
# #   not_if "#{code_path}code --list-extensions|grep -i ms-python.python"
# end

# execute 'VSCode Extension Ruby' do
#   command "#{code_path}code --install-extension rebornix.ruby"
#   user node['user_name'] if platform_family?('debian', 'rhel')
# #   not_if "#{code_path}code --list-extensions|grep -i rebornix.Ruby"
# end

# execute 'VSCode Extension Docker' do
#   command "#{code_path}code --install-extension PeterJausovec.vscode-docker"
#   user node['user_name'] if platform_family?('debian', 'rhel')
# #   not_if "#{code_path}code --list-extensions|grep -i PeterJausovec.vscode-docker"
# end

# # execute 'VSCode Extension Code Runner' do
# #   command "#{code_path}code --install-extension formulahendry.code-runner"
# #   user node['user_name'] if platform_family?('debian', 'rhel')
# # #   not_if "#{code_path}code --list-extensions|grep -i formulahendry.code-runner"
# end
