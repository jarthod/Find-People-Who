class CreateTrackUsers < ActiveRecord::Migration
  def self.up
    create_table :track_users do |t|
      t.integer :track_id
      t.integer :user_id
      t.integer :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :track_users
  end
end
