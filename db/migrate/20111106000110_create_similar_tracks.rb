class CreateSimilarTracks < ActiveRecord::Migration
  def self.up
    create_table :similar_tracks do |t|
      t.integer :track_id
      t.integer :similar_id
      t.integer :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :similar_tracks
  end
end
