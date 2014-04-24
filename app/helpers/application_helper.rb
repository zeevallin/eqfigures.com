module ApplicationHelper

  def icon_suffix(ico, text)
    ( text + " " + icon(ico, "", :after) ).html_safe
  end

  def icon_prefix(ico, text)
    ( icon(ico, "", :before) +  " " + text ).html_safe
  end

  def icon(ico, text = "", location = :before)
    content_tag(:span, text, :class => "ico-#{ico} #{location}-text").html_safe
  end

end
