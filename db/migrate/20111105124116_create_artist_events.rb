class CreateArtistEvents < ActiveRecord::Migration
  def self.up
    create_table :artist_events do |t|
      t.integer :event_id
      t.integer :artist_id
      t.integer :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :artist_events
  end
end
