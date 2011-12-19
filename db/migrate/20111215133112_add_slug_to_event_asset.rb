class AddSlugToEventAsset < ActiveRecord::Migration
  def change
    add_column :event_assets, :slug, :string
  end
end
