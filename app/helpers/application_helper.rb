module ApplicationHelper
	def profile_picture(user)
		if !user.avatar.blank?
			user.avatar.thumb.url
		else
			"avatar.png"
		end
	end

	def post_action_string(story)
		if story.is_a? Advert
			"is selling"
		elsif story.is_a? Post
			"wants to buy"
		end
	end
end
