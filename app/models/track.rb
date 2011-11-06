class Track < ActiveRecord::Base
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