class PostsController < ApplicationController

	def index
 		@posts = current_user.posts.list_of_posts
 		# @posts = Post.all
 		# @posts = Post.all.where(user_id: current_user_id)
 	end
 		@post = Post.count_of_post
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
		@post = current_user.posts.list_of_posts
		@post = Post.find(params[:id])
		@comments = Comment.where(post_id: @post.id)
		@replies = Reply.where(post_id: @post.id)
		@comment = Comment.new
	end
	def edit
		@post = Post.find(params[:id])
		if (@post.user_id != current_user.id) 
			redirect_to posts_path
		 end	
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
