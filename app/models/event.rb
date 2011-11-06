class Event < ActiveRecord::Base
  has_many :artist_events, :dependent => :destroy
  has_many :artists, :through => :artist_events
  has_many :event_users
  has_many :events, :through => :event_users

  before_validation :generate_permalink, :on => :create
  serialize :headliners

  def name
    title
  end

  def sub_data
    {:strdate => start_at.localtime.strftime("%B %d, %Y"),
    :city => city,
    :country => country}
  end

  def fetch_artists!
    return if artist_events.where(:kind => 2).count >= headliners.size
    missings = headliners - artist_events.where(:kind => 2).map(&:artist).map(&:name)
    ra = Rockstar::Artist.new(missings.first, :include_info => true)
    artist = Artist.from_rockstar ra
    artist_events.find_or_create_by_artist_id_and_kind(artist.id, 2)
  end
  
  def self.from_rockstar re
    Event.find_or_create_by_uid({:uid => re.eid,
          :attendance => re.attendance,
          :image => re.images['small'].gsub('/serve/34', '/serve/34s'),
          :title => re.title,
          :url => re.url,
          :start_at => re.start_date,
          :city => re.venue.try(:city),
          :country => re.venue.try(:country),
          :headliners => re.headliners})
  end

protected
  def generate_permalink
    self.permalink = start_at.strftime("%Y%m%d-%H%M-") + title.parameterize
    self.permalink = title if permalink.blank?
  end
end

# == Schema Info
# Schema version: 20111105124523
#
# Table name: events
#
#  id         :integer         not null, primary key
#  attendance :integer
#  image      :string(255)
#  permalink  :string(255)
#  title      :string(255)
#  uid        :integer
#  url        :string(255)
#  created_at :datetime
#  start_at   :datetime
#  updated_at :datetime
