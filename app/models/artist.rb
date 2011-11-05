class Artist < ActiveRecord::Base
  has_many :similars
  has_many :similar_artists, :through => :similars
  has_many :artist_users
  has_many :users, :through => :artist_users
  has_many :artist_events
  has_many :events, :through => :artists_events
  
  before_validation :generate_permalink, :on => :create

  def fetch_events!
    return if artist_events.count > 0
    ra = Rockstar::Artist.new(name)
    ra.events(:limit => 10).each do |re|
      event = Event.from_rockstar re
      artist_events.find_or_create_by_event_id_and_kind(event.id, 1)
    end
  end

protected
  def generate_permalink
    self.permalink = name.parameterize
    self.permalink = name if permalink.blank?
  end
end

# == Schema Info
# Schema version: 20111105124523
#
# Table name: artists
#
#  id         :integer         not null, primary key
#  image      :string(255)
#  mbid       :string(255)
#  name       :string(255)
#  permalink  :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
