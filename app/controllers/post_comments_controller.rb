class PostCommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @post_comment = @post.post_comments.new(post_comment_params)
    respond_to do |format|
      if @post_comment.save
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
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end
