class DateTalks
  
  attr_reader :date, :talks
  
  liquid_methods :date, :talks
  
  def initialize(date, talks)
    @date = date
    @talks = talks
  end
  
end