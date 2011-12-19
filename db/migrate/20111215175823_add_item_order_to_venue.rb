class AddItemOrderToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :item_order, :integer
  end
end
