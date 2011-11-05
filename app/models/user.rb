class User < ActiveRecord::Base
  has_many :event_users
  has_many :events, :through => :event_users
  has_many :artist_users
  has_many :artists, :through => :artist_users
end


# == Schema Info
# Schema version: 20111105124523
#
# Table name: users
#
#  id         :integer         not null, primary key
#  age        :integer
#  country    :string(255)
#  gender     :string(255)
#  image      :string(255)
#  name       :string(255)
#  uid        :integer
#  created_at :datetime
#  updated_at :datetime
