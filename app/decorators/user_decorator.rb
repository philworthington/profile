class UserDecorator < ApplicationDecorator
  decorates :user
  allows :username

  def avatar
    site_link h.image_tag("avatars/#{avatar_name}", class: "avatar")
  end

  def linked_name
    site_link(model.full_name.present? ? model.full_name : model.username)
  end

  def website
    if model.url.present?
      h.link_to model.url, model.url
    else
      h.content_tag :span, "None given", class: "none"
    end
  end

  def twitter
    if model.twitter_name.present?
      h.link_to model.twitter_name, &crarr;
        "http://twitter.com/#{model.twitter_name}"
    else
      h.content_tag :span, "None given", class: "none"
    end
  end

  def bio
    handle_none model.bio do
      markdown(model.bio)
    end
  end

  def member_since
    model.created_at.strftime("%B %e, %Y")
  end

  private
  def site_link(content)
    h.link_to_if model.url.present?, content, model.url
  end

  def avatar_name
    if model.avatar_image_name.present?
      model.avatar_image_name
    else
      "default.png"
    end
  end

  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end
end
