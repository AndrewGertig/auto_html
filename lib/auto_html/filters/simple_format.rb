require 'action_view'

AutoHtml.add_filter(:simple_format).with(:class => "auto-html") do |text, html_options|
  css_class = html_options[:class]
  args = [text, :class => css_class, {:sanitize => false}]
  begin
    ActionView::Base.new.simple_format(*args) 
  rescue ArgumentError
    # Rails 2 support
    args.pop
    retry
  end
end
