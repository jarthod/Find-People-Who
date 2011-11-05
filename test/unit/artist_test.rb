require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20111105124523
#
# Table name: artists
#
#  id         :integer         not null, primary key
#  image      :string(255)
#  mbid       :string(255)
#  name       :string(255)
#  permalink  :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime