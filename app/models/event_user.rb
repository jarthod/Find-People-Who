class EventUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end

# == Schema Info
# Schema version: 20111106000154
#
# Table name: event_users
#
#  id         :integer         not null, primary key
#  event_id   :integer
#  user_id    :integer
#  kind       :integer
#  created_at :datetime
#  updated_at :datetime