class AddColumnToPostas < ActiveRecord::Migration
  def change
  	add_column(:posts, :reply_id, :integer)
  end
end
