require Rails.root.join('vendor/gems/rockstar/lib/rockstar.rb')

Rockstar.lastfm = YAML.load_file(Rails.root.join('config/lastfm.yml'))
