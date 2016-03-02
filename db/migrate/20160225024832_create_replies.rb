class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.date :date_posted
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
