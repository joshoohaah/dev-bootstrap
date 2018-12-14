#
# Cookbook Name:: dev-bootstrap
# File:: vs_code.rb
#
# default['dev-bootstrap']['vscode']['proxy'] = 'http://pitc-cin.cloud.health.ge.com:80/'
# default['dev-bootstrap']['vscode']['strict_ssl'] = false

default['dev-bootstrap']['vscode'].tap do |vscode|
  vscode['proxy'] = 'http://pitc-cin.cloud.health.ge.com:80/'
  vscode['strict_ssl'] = false
  vscode['plugins'] = %w(eamodio.gitlens Pendrica.chef Gruntfuggly.todo-tree donjayamanne.githistory peterjausovec.vscode-docker Angular.ng-template CoenraadS.bracket-pair-colorizer DavidAnson.vscode-markdownlint DotJoshJohnson.xml EditorConfig.EditorConfig eg2.tslint eg2.vscode-npm-script file-icons.file-icons hbenl.vscode-jasmine-test-adapter hbenl.vscode-test-explorer HookyQR.beautify ipedrazas.kubernetes-snippets joelday.docthis ms-azuretools.vscode-azureappservice ms-azuretools.vscode-azurefunctions ms-azuretools.vscode-azurestorage ms-azuretools.vscode-cosmosdb ms-kubernetes-tools.vscode-kubernetes-tools ms-mssql.mssql ms-vscode.azure-account ms-vscode.azurecli ms-vscode.csharp ms-vscode.PowerShell ms-vscode.vscode-node-azure-pack msazurermtools.azurerm-vscode-tools msjsdiag.debugger-for-chrome PeterJausovec.vscode-docker psioniq.psi-header rbbit.typescript-hero redhat.vscode-yaml robertohuertasm.vscode-icons slevesque.perforce vsciot-vscode.azure-iot-toolkit wayou.vscode-todo-highlight Zignd.html-css-class-completion)
end