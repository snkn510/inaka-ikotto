module ApplicationHelper
  def format_newline(text)
    text.gsub("\n", '<br>').html_safe
  end
end
