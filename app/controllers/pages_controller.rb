class PagesController < ApplicationController
	def index
		unless user_signed_in?
			redirect_to new_user_session_path
		end
		@posts = Post.all.list_of_posts

	end
end