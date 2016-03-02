class PostsController < ApplicationController

	 def index
 		@posts = current_user.posts
 	 	@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			@post.update!(user_id: current_user.id)
			redirect_to posts_path
		
		else
			render "new"
		end
	end

	def show
		@post = Post.find(params[:id])
		@comments = Comment.where(post_id: @post.id)
		@replies = Reply.where(post_id: @post.id)
		# @replies = comment.replies.find(params)[:id]
	end

	def edit
		@post = Post.find(params[:id])
	end 
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to post_path(@post)
		else render "edit"
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	def post_params
		params.require(:post).permit!
	end
end
