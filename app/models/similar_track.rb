class SimilarTrack < ActiveRecord::Base
end

# == Schema Info
# Schema version: 20111106000154
#
# Table name: similar_tracks
#
#  id         :integer         not null, primary key
#  similar_id :integer
#  track_id   :integer
#  kind       :integer
#  created_at :datetime
#  updated_at :datetime