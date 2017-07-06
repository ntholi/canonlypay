class HomeController < ApplicationController
  def index
    if(params[:city])
      @posts = Post.where(city: params[:city]).order('created_at DESC')
    else
      @posts = Post.all.order('created_at DESC')
    end
  end
end
