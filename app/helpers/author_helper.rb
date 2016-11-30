module AuthorHelper
	def avatar_for(author, options = {size: 160}) 
		size = options[:size]
		if author.avatar?
			image_tag author.avatar.url(:thumb), width: size, class: 'avatar-image'
		else 
			image_tag "profile_default.jpg", width: size, class: 'avatar-image'
		end
	end
end
