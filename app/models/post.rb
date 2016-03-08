class Post < ActiveRecord::Base
	
	validates :title, presence: true
	validates :date_posted, presence: true
	validates :content, presence: true
	belongs_to :category

	has_many :comments
	accepts_nested_attributes_for :comments

	has_many :replies
	belongs_to :user

	scope :list_of_posts, -> { order(created_at: :desc) }
	scope :count_of_post, -> { count }

end
