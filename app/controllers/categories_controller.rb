class CategoriesController < ApplicationController
	def index
	  # @categories = current_user.categories
 	 	@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create		
		@category = Category.new(category_params)

		if @category.save
			@category.update!(user_id: current_user.id)
			redirect_to categories_path
		else
			render "new"
		end
	end

	def show
		@category = Category.find(params[ :id])
		@posts = Post.where(category_id: @category.id)
	end

	def edit
		@category = Category.find(params[ :id])
	end

	def update
		@category = Category.find(params[ :id])

		if @category.update_attributes(category_params)
			redirect_to category_path(@category)
		else
			render "edit"
		end
	end

	def destroy
		@category = Category.find(params[ :id])
		@category.destroy
		redirect_to categories_path
	end


	def category_params
			params.require(:category).permit!
	end

end