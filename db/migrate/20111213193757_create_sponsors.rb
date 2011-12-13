class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.string :slug
      t.integer :event_id
      t.string :url
      t.integer :item_order
      t.boolean :published
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at
      t.string :sponsor_type, :default => "Sponsor"
      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
