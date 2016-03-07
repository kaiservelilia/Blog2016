module Posts
module Comments
	class RepliesController < ApplicationController
		before_filter :load_defaults

		def load_defaults
			@post = Post.find(params[:post_id])
			@comment = Comment.find(params[:comment_id])
		end

		def new
			@reply = Reply.new
			post = Post.find(params[:post_id])
			comment = Comment.find[:comment_id]
			# @comment = post.comments.build
			@reply = comment.replies.build
		end

		def create
			@reply = Reply.new(reply_params)
			@reply.comment.post = @post

			if @reply.save
				@reply.update!(user_id: current_user.id)
				redirect_to comments_path(@comment)

			else
				render "new"
			end
		end

		# def show
		# 	@comment = Comment.find(params[:id])
		# 	post = Post.find(params[:post_id])
		#     @comment = post.comments.find(params[:id])
		#     @replies = Reply.where(comment_id: @comment.id)
		# end
		# def edit
		# 	@comment = Comment.find(params[:id])
		# 	post = Post.find(params[:post_id])
		#     @comment = post.comments.find(params[:id])
		# end

		# def update
		# 	@comment = Comment.find(params[:id])
		# 	post = Post.find(params[:post_id])
		#     @comment = post.comments.find(params[:id])

		#   if @comment.update_attributes(comment_params)
		#   	redirect_to post_path(@comment.post_id)
		#   else	
		#   	render"edit"
		#   end
		# end

		# def destroy

		# 	@comment = Comment.find(params[:id])
		# 	post = Post.find(params[:post_id])
		#     @comment = post.comments.find(params[:id])
		#     @comment.destroy

		#     respond_to do |format|
		#       format.html { redirect_to(post_comments_url) }
		#       format.xml  { head :ok }
		#     end
	 #  	end

		def reply_params
				params.require(:reply).permit!
		end
	end
end