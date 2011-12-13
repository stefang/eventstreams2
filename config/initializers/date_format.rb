Date::DATE_FORMATS.merge!(
  :dmy_long => Proc.new { |date| "#{date.day.ordinalize} #{date.strftime '%B %Y'}" },
  :dm_long => Proc.new { |date| "#{date.day.ordinalize} #{date.strftime '%B'}" },
  :form_display => "%d-%m-%Y",
  :programme_header => Proc.new { |date| "<span class='day'>#{date.strftime '%A'}</span> <span class='date'>#{date.day.ordinalize} #{date.strftime '%B'}</span>" }
)