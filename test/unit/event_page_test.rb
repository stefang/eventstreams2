require 'test_helper'

class EventPageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert EventPage.new.valid?
  end
end
