class CreateArtistTracks < ActiveRecord::Migration
  def self.up
    create_table :artist_tracks do |t|
      t.integer :artist_id
      t.integer :track_id
      t.integer :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :artist_tracks
  end
end
