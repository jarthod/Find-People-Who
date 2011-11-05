class ArtistUser < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user
end

# == Schema Info
# Schema version: 20111105124523
#
# Table name: artist_users
#
#  id         :integer         not null, primary key
#  artist_id  :integer
#  user_id    :integer
#  kind       :integer
#  created_at :datetime
#  updated_at :datetime