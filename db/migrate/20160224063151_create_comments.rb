class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.date :date_posted
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
