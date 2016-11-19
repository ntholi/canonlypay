module PostsHelper
	def setup_post(post)
		post.user ||= User.new
		post.product ||= Product.new
		post
  end
end
