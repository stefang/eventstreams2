class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.text :address
      t.string :postcode
      t.float :latitude
      t.float :longitude
      t.string :website
      t.string :phone_number
      t.boolean :published
      t.integer :event_id
      t.string :slug
      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
