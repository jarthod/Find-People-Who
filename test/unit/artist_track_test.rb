require 'test_helper'

class ArtistTrackTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20111106000154
#
# Table name: artist_tracks
#
#  id         :integer         not null, primary key
#  artist_id  :integer
#  track_id   :integer
#  kind       :integer
#  created_at :datetime
#  updated_at :datetime