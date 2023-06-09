class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false      #ユーザーID
      t.integer :post_name, null: false    #投稿の名前
      t.text :caption, null: false         #投稿本文
      t.timestamps
    end
  end
end
