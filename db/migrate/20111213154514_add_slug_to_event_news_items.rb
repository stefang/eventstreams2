class AddSlugToEventNewsItems < ActiveRecord::Migration
  def change
    add_column :event_news_items, :slug, :string
  end
end
