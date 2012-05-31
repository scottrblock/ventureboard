module UsersHelper
  def gravatar_for(user, size=80)
    gravatar_id = Digest::MD5::hexdigest(user.email.to_s.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=retro&r=pg&s=#{size}"
    image_tag(gravatar_url, alt: user.full_name, class: "gravatar", :size => "#{size}x#{size}")
  end
  
  def get_latest_users(n)
	User.last(n).reverse
  end
  
  def get_user_type(t)
    User.where("user_type_id = ?", t)
  end
end
