class CreateSimilars < ActiveRecord::Migration
  def self.up
    create_table :similars, :id => false do |t|
      t.integer :artist_id
      t.integer :similar_id
      t.integer :kind
      t.timestamps
    end
  end

  def self.down
    drop_table :similars
  end
end
