class CreateArtistUsers < ActiveRecord::Migration
  def self.up
    create_table :artist_users do |t|
      t.integer :artist_id
      t.integer :user_id
      t.integer :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :artist_users
  end
end
