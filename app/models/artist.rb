class Artist < ActiveRecord::Base
  has_many :similars
  has_many :similar_artists, :through => :similars
  has_many :artist_users
  has_many :users, :through => :artist_users
  has_many :artist_events
  has_many :events, :thourgh => :artists_events
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
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
