class Similar < ActiveRecord::Base
  belongs_to :artist
  belongs_to :similar, :class_name => :artist
end

# == Schema Info
# Schema version: 20111105124523
#
# Table name: similars
#
#  artist_id  :integer
#  similar_id :integer
#  created_at :datetime
#  updated_at :datetime