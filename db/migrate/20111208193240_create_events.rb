class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :published
      t.string :tagline
      t.text :description
      t.string :twitter_account
      t.string :twitter_hashtag
      t.string :google_analytics
      t.string :booking_url
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
