module UsersHelper
  def gravatar_for(user, size: 100)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end


  def edit(current_user)
    if current_user.uid == nil
      edit_user_registration_path(current_user)
    else
      edit_user_path(current_user)
    end
  end
end
