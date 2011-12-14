class CorrectTalkFields2 < ActiveRecord::Migration
  def change
    add_column :talks, :venue_id, :integer
    remove_column :talks, :item_order
  end
end
