module HomeHelper
	def story_action(story)
		if story.is_a? Advert
			"is selling"
		elsif story.is_a? Post
			"wants to buy"
		end
	end
end
