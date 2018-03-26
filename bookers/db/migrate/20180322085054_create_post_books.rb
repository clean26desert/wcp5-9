class CreatePostBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :post_books do |t|
      t.text :book_name
      t.text :book_opinion
      t.integer :user_id
      t.integer :userimage_id

      t.timestamps
    end
  end
end
