class Track < ActiveRecord::Base
  has_many :similar_tracks, :foreign_key => 'similar_id'
  has_many :artist_tracks
  has_many :track_users
  has_many :users, :through => :track_users
  has_many :artists, :through => :artist_tracks
    
  before_validation :generate_permalink, :on => :create

=begin
  def fetch_events!
    return if artist_events.count > 0
    ra = Rockstar::Artist.new(name)
    ra.events(:limit => 20).each do |re|
      event = Event.from_rockstar re
      artist_events.find_or_create_by_event_id_and_kind(event.id, 1)
    end
  end
  
  def fetch_artists!
    return if similars.count > 0
    ra = Rockstar::Artist.new(name)
    ra.similar(:limit => 6).each do |similar|
      artist = Artist.from_rockstar similar
      similars.find_or_create_by_artist_id_and_kind(artist.id, 1)
    end
  end

=end
  
  def self.from_rockstar rt
    Track.find_or_create_by_name_and_artist_name({:name => rt.name,
          :url => rt.url,
          :artist_name => rt.artist})
  end

  def sub_data
    { :artist_name => artist_name } 
  end

  def image
    "http://cdn.last.fm/flatness/preview/play_indicator.png"
  end

protected
  def generate_permalink
    self.permalink = name.parameterize + "-by-" + artist_name.parameterize
    self.permalink = name if permalink.blank?
  end
end

# == Schema Info
# Schema version: 20111106000154
#
# Table name: tracks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  uid        :integer
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime