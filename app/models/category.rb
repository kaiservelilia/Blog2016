class Category < ActiveRecord::Base

	validates :name, presence: true
	has_many :posts
	belongs_to :user
	
	# scope :post_count, -> { joins (:posts).select ("") }
	scope :list_of_categories, -> { order(created_at: :desc) }
	scope :count_of_category, -> { count }

end
