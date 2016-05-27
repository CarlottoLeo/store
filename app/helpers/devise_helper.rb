module DeviseHelper
  # override devise method to apply new html
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger" role="alert">
      <h4>#{t('messages.error.header')}</h4>
      <p>#{messages}</p>
    </div>
    HTML

    html.html_safe
  end

  # override devise method to apply new html
  def devise_error_messages?
    !resource.errors.empty?
  end
end
