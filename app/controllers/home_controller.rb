class HomeController < ApplicationController
  def index
  	@adverts = Advert.all
    @posts = Post.all
  end
end
