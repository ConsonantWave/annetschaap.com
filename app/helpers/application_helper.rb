# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def back_link(name, options = {}, html_options = nil)
    content_for(:back_link) { link_to "Back to " + name, options, html_options }
  end
  
  def other_language_name(locale)
    return locale == "en" ? "Nederlands" : "English"
  end
  
  def locale_switch_uri()
    curr_uri = request.request_uri
    curr_prefix = "/" + I18n.locale.to_s
    new_prefix = curr_prefix == "/en" ? "/nl" : "/en"
    
    if curr_uri[0...3] == curr_prefix # false if locale hasn't been picked yet
      new_uri = curr_uri.sub(curr_prefix, new_prefix)
    else
      new_uri = new_prefix + curr_uri
    end
    
    return new_uri
  end
  
  def parse_text(text)
    text = h text
    text = text.gsub("\r\n", "\n").
      gsub("\n\n", "</p><p>").
      gsub("\n", "<br />").
      gsub(/\[b\](.*)\[\/b\]/i, '<strong>\1</strong>').
      gsub(/\[i\](.*)\[\/i\]/i, '<em>\1</em>').
      gsub(/\[link=(http:\/\/.+?)\](.*?)\[\/link\]/i, '<a href="\1">\2</a>').
      gsub(/\[link=(.+?)\](.*?)\[\/link\]/i, '<a href="http://\1">\2</a>').
      gsub(/(\[[^\]]*\])/, "")
    return "<p>" + text + "</p>"
  end
end
