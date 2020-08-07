module UsersHelper
 # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user, options = { size: 90})
   gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
   size = options[:size]
   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
   image_tag(gravatar_url, alt: user.name, class: "img-circle gravatar")
  end
end
