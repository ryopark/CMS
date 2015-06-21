class CommentsController < ApplicationController

	http_basic_authenticate_with name: "user", password: "123", only: :destroy


	before_action :set_comment

	def create

    	@comment = @post.comments.create(comment_params)
    	redirect_to post_path(@post)
    end

  	def destroy
  		
  		@comment = @post.comments.find(params[:id])
  		@comment.destroy

  		redirect_to post_path(@post)
  	end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

    def set_comment
    	@post = Post.find(params[:post_id])
    end
end