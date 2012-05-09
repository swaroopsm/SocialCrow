module UsersHelper
	def gravatar_for(user)
		gravatar_id=Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url="http://gravatar.com/avatar/#{gravatar_id}.png"
		link_to(image_tag(gravatar_url,alt:user.name,class:"gravatar",title:user.name),"/@/#{user.username}")
	end
end
