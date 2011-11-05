class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.integer :uid
      t.string :image
      t.string :country
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
