require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20111106000154
#
# Table name: events
#
#  id         :integer         not null, primary key
#  attendance :integer
#  city       :string(255)
#  country    :string(255)
#  image      :string(255)
#  permalink  :string(255)
#  title      :string(255)
#  uid        :integer
#  url        :string(255)
#  created_at :datetime
#  start_at   :datetime
#  updated_at :datetime