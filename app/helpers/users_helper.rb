module UsersHelper
	def gravatar_for(user,size=100)
		gravatar_id=Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url="http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
		link_to(image_tag(gravatar_url,alt:user.name,class:"thumbnail",title:user.name,id:"gravatar-thumbnail"),"/@/#{user.username}")
	end
end
