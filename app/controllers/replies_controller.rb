class RepliesController < ApplicationController

	def index
			@replies= current_user.replies
 	 		@replies = Reply.all
	end	

	def new
		@reply = Reply.new
	end
	def create
		@reply = Reply.new(reply_params)
		if @reply.save
			# @reply.update!(user_id: current_user.id)
			redirect_to replies_path
		else
			render "new"
		end
	end

	def show
		@reply = Reply.find(params[:id])
		# comment = Comment.find(params[:comment_id])
	    # @reply = comment.replies.find(params[:id])
	end


	def edit
		@reply = Reply.find(params[:id])
	end

	def update
			@reply = Reply.find(params[:id])
		  if @reply.update_attributes(reply_params)
		  	redirect_to reply_path(@reply)
		  else	
		  	render"edit"
		  end
	end
	def destroy

		@reply = Reply.find(params[:id])
		@reply.destroy
		redirect_to replies_path
  	end

	def reply_params
			params.require(:reply).permit!
		end
	end