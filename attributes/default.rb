
default['dev-bootstrap']['apps'].tap do |apps|
    # Browsers to Install
    apps['browser'] = %w(googlechrome firefox)
    apps['perforce'] = %w(p4 p4v p4merge)
end