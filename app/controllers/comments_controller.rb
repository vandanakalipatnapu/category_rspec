class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@post =Post.find(params[:post_id])	
		@comment = @post.comments.create(comment_params)

		if @comment.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to posts_path

	end


	private
		def comment_params
			params[:comment].permit(:description,:post_id)
		end
end
