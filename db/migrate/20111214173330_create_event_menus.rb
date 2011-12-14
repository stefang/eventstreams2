class CreateEventMenus < ActiveRecord::Migration
  def self.up
    create_table :event_menus do |t|
      t.string :item_type
      t.integer :item_id
      t.integer :event_id
      t.integer :item_order
      t.string :title
      t.string :url
      t.string :location
      t.timestamps
    end
  end

  def self.down
    drop_table :event_menus
  end
end
