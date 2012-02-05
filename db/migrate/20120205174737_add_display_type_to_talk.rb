class AddDisplayTypeToTalk < ActiveRecord::Migration
  def change
    add_column :talks, :display_type, :string
  end
end
