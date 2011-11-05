require 'vendor/gems/rockstar/lib/rockstar.rb'

class User < ActiveRecord::Base
  has_many :event_users
  has_many :events, :through => :event_users
  has_many :artist_users
  has_many :artists, :through => :artist_users
  
  def fetch_info!
    ru = Rockstar::User.new name, :include_profile => true
    self.uid = ru.id
    self.age = ru.age
    self.country = ru.country
    self.gender = ru.gender
    self.image = ru.avatar.gsub('/serve/34', '/serve/34s')
    save
  rescue
    errors.add :name, :invalid
  end
  
  def fetch_top_artists!
    ru = Rockstar::User.new name
    ru.top_artists.each do |ra|
      puts ra.inspect
      artist = Artist.find_or_create_by_mbid({:mbid => ra.mbid, :image => ra.thumbnail.gsub('/serve/34', '/serve/34s'), :name => ra.name, :url => ra.url})
      artist_users.create(:artist => artist, :kind => 1)
    end
  end
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
#  permalink  :string(255)
#  uid        :integer
#  created_at :datetime
#  updated_at :datetime