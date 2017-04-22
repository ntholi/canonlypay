module ApplicationHelper
	def profile_picture(user)
		if !user.avatar.blank?
			user.avatar_url
		else
			"avatar.png"
		end
	end
end
