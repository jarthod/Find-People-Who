require 'test_helper'

class EventUserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Info
# Schema version: 20111105124523
#
# Table name: event_users
#
#  id         :integer         not null, primary key
#  event_id   :integer
#  user_id    :integer
#  kind       :integer
#  created_at :datetime
#  updated_at :datetime