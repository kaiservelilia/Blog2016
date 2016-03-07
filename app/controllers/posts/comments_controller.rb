module Posts
	class CommentsController < ApplicationController
		before_filter :load_defaults

		def load_defaults
			@post = Post.find(params[:post_id])
		end

		def new
			@comment = Comment.new
			post = Post.find(params[:post_id])
	    @comment = post.comments.build
		end

		def create
			@comment = Comment.new(comment_params)
			@comment.post = @post

			if @comment.save
				@comment.update!(user_id: current_user.id)
				redirect_to post_path(@post)

			else
				render "new"
			end
		end

		def show
			@comment = Comment.find(params[:id])
			post = Post.find(params[:post_id])
		    @comment = post.comments.find(params[:id])
		    @replies = Reply.where(comment_id: @comment.id)
		end
		def edit
			@comment = Comment.find(params[:id])
			post = Post.find(params[:post_id])
		    @comment = post.comments.find(params[:id])
		end

		def update
			@comment = Comment.find(params[:id])
			post = Post.find(params[:post_id])
		    @comment = post.comments.find(params[:id])

		  if @comment.update_attributes(comment_params)
		  	redirect_to post_path(@comment.post_id)
		  else	
		  	render"edit"
		  end
		end

		def destroy

			@comment = Comment.find(params[:id])
			post = Post.find(params[:post_id])
		    @comment = post.comments.find(params[:id])
		    @comment.destroy

		    respond_to do |format|
		      format.html { redirect_to(post_comments_url) }
		      format.xml  { head :ok }
		    end
	  	end

		def comment_params
				params.require(:comment).permit!
		end
	end
end