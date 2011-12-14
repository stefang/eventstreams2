class CorrectTalkFields < ActiveRecord::Migration
  def change
    add_column :talks, :start, :datetime
    add_column :talks, :duration, :integer
    add_column :talks, :track_id, :integer
  end
end