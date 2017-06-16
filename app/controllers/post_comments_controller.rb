class PostCommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user = current_user
    respond_to do |format|
      if @post_comment.save
        create_notification(@post_comment)
        format.html { redirect_to @post, notice: 'Comment was successfully added.' }
        format.json { render :show, status: :created, location: @post_comment }
      else
        format.html { redirect_to @post, alert: 'Unable to add comment' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

 def destroy
 		@post_comment = @post.post_comments.find(params[:id])
    @post_comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment deleted!' }
      format.json { head :no_content }
    end
  end

  private
    def create_notification(comment)
      unless @post.user == current_user
        notification = Notification.new
        notification.content = "#{comment.owner} commented on your post"
        notification.link = post_url(@post)
        notification.user = @post.user
        notification.save
        notification.update(link: notification.link++"?notif=#{notification.id}")
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end
