class CreateEventAssets < ActiveRecord::Migration
  def self.up
    create_table :event_assets do |t|
      t.string :title
      t.integer :event_id
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.datetime :asset_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :event_assets
  end
end
