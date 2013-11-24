class ApplicationDecorator < Draper::Base
  def markdown(text)
    Redcarpet.new(text, :hard_wrap, :filter_html, &crarr;
      :autolink).to_html.html_safe
  end
end
