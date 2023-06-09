class CreatePackings < ActiveRecord::Migration[6.1]
  def change
    create_table :packings do |t|
      t.integer :user_id, null: false             #ユーザーID
      t.integer :packing_name, null: false        #持ち物の名前
      t.timestamps
    end
  end
end
