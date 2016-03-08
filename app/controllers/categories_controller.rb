class CategoriesController < ApplicationController
	def index
	   # @categories = current_user.categories
	  # @categories = current_user.categories.list_of_categories
 	 	 @categories = Category.all.where(user_id: current_user)
	end
	@category = Category.count_of_category
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
		# @categories = current_user.categories.list_of_categoriess
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