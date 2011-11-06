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
=end
  
  def fetch_tracks!
    return if similar_tracks.count > 0
    rt = Rockstar::Track.new(artist_name, name)
    rt.similar(10).each do |similar|
      track = Track.from_rockstar similar
      similar_tracks.find_or_create_by_track_id_and_kind(track.id, 1)
    end
  end
  
  def self.from_rockstar rt
    Track.find_or_create_by_name_and_artist_name({:name => rt.name,
          :url => rt.url,
          :artist_name => rt.artist})
  end

  def sub_data
    { :artist_name => artist_name } 
  end

  def image
    "/images/cd.png"
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
