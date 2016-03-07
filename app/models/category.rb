class Category < ActiveRecord::Base

	validates :name, presence: true
	has_many :posts
	belongs_to :user
	
end
