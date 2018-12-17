
default['dev-bootstrap']['apps'].tap do |apps|
    # Browsers to Install
    apps['browser'] = %w(googlechrome firefox)
end