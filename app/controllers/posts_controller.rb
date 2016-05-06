class PostsController < ApplicationController
	def new 
		@post = Post.new
	end

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comments = Comment.all
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create 
		@post =Post.create(post_params)
		if @post.save
			redirect_to posts_path
		else
			render "new"
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to posts_path
		else
			render "edit"
		end
	end

	def destroy
		@post =Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
		def post_params
			params[:post].permit(:title,:description,:category)
		end
end
