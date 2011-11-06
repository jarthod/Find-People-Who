class ArtistEvent < ActiveRecord::Base
  belongs_to :artist
  belongs_to :event
end

# == Schema Info
# Schema version: 20111106000154
#
# Table name: artist_events
#
#  id         :integer         not null, primary key
#  artist_id  :integer
#  event_id   :integer
#  kind       :integer
#  created_at :datetime
#  updated_at :datetime