require 'redcarpet'

class NoParagraphRenderer < ::Redcarpet::Render::XHTML
  def paragraph(text)
    text
  end    
end

AutoHtml.add_filter(:image).with(:alt => 'default-alt', :class => '') do |text, options|
  r = Redcarpet::Markdown.new(NoParagraphRenderer)
  alt = options[:alt]
  klass = options[:class]
  # puts "[APG] image.rb ********************************"
  img = text.gsub(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    # r.render("[![#{alt}](#{match})](#{match}))")
    r.render("![#{alt}](#{match})")
  end
  # "<div class='#{klass}'>" + img + "</div>"
end