# python_runtime '3.7.1' do
#     action :install
#     pip_version true
# end
chocolatey_package 'python' do
    action :upgrade
end

execute 'upgrade pip' do
    command 'python -m pip install --upgrade pip'
    sensitive false
    action :run
end

if platform_family?('windows')
  current_path = ENV['Path'].to_s
  env 'PATH' do
    action :modify
    value 'C:\\Python37'
    delim ';'
    not_if { current_path.include? 'Python37' }
  end
  env 'PATH' do
    action :modify
    value 'C:\\Python37\\Scripts'
    delim ';'
    not_if { current_path.include? 'Python37\Scripts' }
  end
  log "Path= #{ENV['PATH']}"
  
end

## TODO Put a guard around here so it does not run every time.
execute 'install package' do
    guard_interpreter :powershell_script
    sensitive false
    command 'pip3 install asciinema'
    action :run
    # not_if { a = Chef::Resource::PowershellScript.new("pip freeze") 
    #         a.include? 'asciinema'}
end

