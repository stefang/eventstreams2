class AddCustomMenuTitleToEventMenu < ActiveRecord::Migration
  def change
    add_column :event_menus, :custom_title, :string
  end
end