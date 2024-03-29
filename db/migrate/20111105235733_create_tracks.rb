class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.integer :uid
      t.string :name
      t.string :url
      t.string :artist_name
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
