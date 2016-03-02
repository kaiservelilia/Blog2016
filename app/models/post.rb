class Post < ActiveRecord::Base
	
		validates :title, presence: true
		validates :date_posted, presence: true
		validates :content, presence: true
		belongs_to :category
		has_many :comments
		has_many :replies

		belongs_to :user#, :as => :created_by
end

#post.created_by
