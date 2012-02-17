class Talk < ActiveRecord::Base
  extend FriendlyId
  friendly_id :first_ten_words, :use => :scoped, :scope => :event

  attr_accessible :title, :description, :event_id, :slug, :published, :item_order, :duration, :track_id, :venue_id, :speaker_ids, :start, :display_type
  
  belongs_to :track
  belongs_to :venue
  belongs_to :event
  has_and_belongs_to_many :speakers
  
  scope :published, where(:published => true)
  
  liquid_methods :display_title, :description, :url, :speakers, :track
  
  def url
    "#{Rails.application.routes.url_helpers.talks_path}/#{slug}"
  end
  
  def first_ten_words
    title.split(/\s+/)[0..9].compact.join(" ")
  end
  
  def date
    start.to_date
  end
  
  def display_title
    if title.blank? && !speakers.blank?
      s = speakers.published.map {|s| s.name}
      s.to_sentence
    elsif title.blank?
      "<span class='no_title_or_speakers'>No title or speakers</span>".html_safe
    else
      title
    end
  end
  
end