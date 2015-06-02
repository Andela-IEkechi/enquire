module ApplicationHelper
  def relevant_years
    range = ((Date.current.year - 96)..(Date.current.year)).to_a
    range.reverse
  end
end
