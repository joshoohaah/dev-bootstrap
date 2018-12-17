name 'dev-bootstrap'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures dev-bootstrap'
long_description 'Installs/Configures dev-bootstrap'
version '0.1.0'
chef_version '>= 13.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/dev-bootstrap/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/dev-bootstrap'

chef_version '>= 14.7' if respond_to?(:chef_version)

supports 'windows'

# depends 'magic_shell'
# depends 'java'
# depends 'apt'
depends 'chocolatey'
depends 'powershell'
depends 'iis'
