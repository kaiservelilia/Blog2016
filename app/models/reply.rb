class Reply < ActiveRecord::Base

	belongs_to :comment
	belongs_to :post
	belongs_to :user

	scope :list_of_replies, -> { order(created_at: :desc) }
	scope :count_of_reply, -> { count }

end
