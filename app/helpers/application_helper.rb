module ApplicationHelper

  def display_currency(value)
    "%.2f" % value.truncate(2)
  end
  
end
