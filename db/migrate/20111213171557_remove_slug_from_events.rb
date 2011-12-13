class RemoveSlugFromEvents < ActiveRecord::Migration
  def up
    remove_index :events, :slug
    remove_column :events, :slug
  end

  def down
    add_column :events, :slug, :string
    add_index :events, :slug, :unique => true
  end
end
