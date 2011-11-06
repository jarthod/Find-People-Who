class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :uid
      t.string :title, :country, :city
      t.datetime :start_at
      t.string :image
      t.integer :attendance
      t.string :url
      t.string :permalink
      t.timestamps
      t.string :headliners
    end
  end

  def self.down
    drop_table :events
  end
end
