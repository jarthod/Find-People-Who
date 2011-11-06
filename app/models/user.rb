require Rails.root.join('vendor/gems/rockstar/lib/rockstar.rb')

class User < ActiveRecord::Base
  has_many :event_users
  has_many :events, :through => :event_users
  has_many :artist_users
  has_many :artists, :through => :artist_users
  has_many :track_users
  has_many :tracks, :through => :track_users
  
  def fetch_info!
    ru = Rockstar::User.new name, :include_profile => true
    self.uid = ru.id
    self.age = ru.age
    self.country = ru.country
    self.gender = ru.gender
    self.image = ru.avatar.gsub('/serve/34', '/serve/34s')
    save
  rescue
    errors.add :name, :invalid
  end
  
  def fetch_artists!
    return if artist_users.count > 0
    ru = Rockstar::User.new name
    ru.top_artists.each do |ra|
      artist = Artist.from_rockstar ra
      artist_users.find_or_create_by_artist_id_and_kind(artist.id, 1)
    end
  end
  
  def fetch_events!
    return if event_users.count > 0
    geo = Rockstar::Geo.new
    # GPS version
    #events = geo.events(:lat => 50.0, :long => 12.3)
    events = geo.events(:location => country, :limit => 50)
    events.each do |re|
      event = Event.from_rockstar re
      event_users.find_or_create_by_event_id_and_kind(event.id, 1)
    end
  end

  def fetch_tracks!
    return if track_users.count > 0
    ru = Rockstar::User.new name
    ru.recent_tracks.each do |rt|
      track = Track.from_rockstar rt
      track_users.find_or_create_by_track_id_and_kind(track.id, 1)
    end
  end
  
  def image_with_fallback
    if image.present?
      image
    else
      'http://cdn.last.fm/flatness/catalogue/noimage/2/default_user_small.png'
    end
  end
end

# == Schema Info
# Schema version: 20111106000154
#
# Table name: users
#
#  id         :integer         not null, primary key
#  age        :integer
#  country    :string(255)
#  gender     :string(255)
#  image      :string(255)
#  name       :string(255)
#  permalink  :string(255)
#  uid        :integer
#  created_at :datetime
#  updated_at :datetime
