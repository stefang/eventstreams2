class CreateSpeakers < ActiveRecord::Migration
  def self.up
    create_table :speakers do |t|
      t.string :name
      t.text :biog
      t.integer :event_id
      t.boolean :published
      t.string :slug
      t.string :portrait_file_name
      t.string :portrait_content_type
      t.integer :portrait_file_size
      t.datetime :portrait_updated_at
      t.integer :item_order
      t.timestamps
    end
  end

  def self.down
    drop_table :speakers
  end
end
