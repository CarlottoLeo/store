module DeviseHelper
  # override devise method to apply new html
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="ui red negative message">
      <h2>Oops, there are some problems:</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  # override devise method to apply new html
  def devise_error_messages?
    !resource.errors.empty?
  end

end
