class SponsorsController < ApplicationController

  layout :set_layout

  def index
    get_published_or_owned_event
  end
  
end
