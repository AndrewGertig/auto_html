require 'action_view'

AutoHtml.add_filter(:simple_format).with(:class => "auto-html") do |text, html_options|
  args = [text, {:class => html_options[:class]}, {:sanitize => false}]
  begin
    ActionView::Base.new.simple_format(*args) 
  rescue ArgumentError
    # Rails 2 support
    args.pop
    retry
  end
end
