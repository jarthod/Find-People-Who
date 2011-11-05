class Event < ActiveRecord::Base
  has_many :artist_events
  has_many :artists, :through => :artists_events
  has_many :event_users
  has_many :events, :through => :event_users
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