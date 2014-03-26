module ApplicationHelper

  def icon_suffix(ico, text)
    ( text + " " + icon(ico) ).html_safe
  end

  def icon_prefix(ico, text)
    ( icon(ico) +  " " + text ).html_safe
  end

  def icon(ico, text = "")
    content_tag(:span, text, :class => "ico-#{ico}").html_safe
  end

end
