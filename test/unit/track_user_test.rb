require 'test_helper'

class TrackUserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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