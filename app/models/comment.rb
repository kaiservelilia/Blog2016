class Comment < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :post
	
	belongs_to :parent_comment, class_name: "Comment", :foreign_key => "parent_comment_id"

	def replies
		Comment.where(parent_comment_id: self.id)
	end

	def is_not_reply?
		if self.parent_comment_id.nil?
			true
		else
			false
		end

	end

	scope :list_of_comments, -> { order(created_at: :desc) }
	scope :count_of_comment, -> { count }

end
