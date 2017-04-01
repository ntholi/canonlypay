class HomeController < ApplicationController
  def index
  	@feed = []
  	adverts = Advert.all
  	posts = Post.all
  	@feed += adverts
  	@feed += posts
  end
end
