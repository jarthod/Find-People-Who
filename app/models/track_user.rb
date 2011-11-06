class TrackUser < ActiveRecord::Base
end


# == Schema Info
# Schema version: 20111106000154
#
# Table name: track_users
#
#  id         :integer         not null, primary key
#  track_id   :integer
#  user_id    :integer
#  kind       :integer
#  created_at :datetime
#  updated_at :datetime