# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # h + n2br
  def hbr(str)
    html_escape(str).gsub(/\r\n|\r|\n/, "<br />\n")
  end

  # h + quote
  def hsq(str)
    html_escape(str).gsub(/'/, '&apos;')
  end

  # notice tag
  def notice(image_name = "notice.gif")
    content_tag(:div, image_tag("notice.gif", :class => "icon")+flash[:notice], :id => "notice") if flash[:notice]
  end

  # warn tag
  def warn(image_name = "warn.gif")
    content_tag(:div, image_tag("warn.gif", :class => "icon")+flash[:warn], :id => "warn") if flash[:warn]
  end

  def focus(element)
    content_tag(:script, "document.getElementById('#{element}').focus()", :type => "text/javascript")
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def keywords(page_keywords)
    content_for(:keywords) { page_keywords }
  end
end
