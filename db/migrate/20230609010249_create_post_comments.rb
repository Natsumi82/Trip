class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.integer :user_id                #ユーザーID
      t.text :comment                   #コメント本文
      t.integer :post_id                #投稿ID
      t.timestamps
    end
  end
end
