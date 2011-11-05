require 'test_helper'

class ArtistEventTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Info
# Schema version: 20111105124523
#
# Table name: artist_events
#
#  id         :integer         not null, primary key
#  artist_id  :integer
#  event_id   :integer
#  kind       :integer
#  created_at :datetime
#  updated_at :datetime