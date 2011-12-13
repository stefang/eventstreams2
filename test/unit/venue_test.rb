require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Venue.new.valid?
  end
end
