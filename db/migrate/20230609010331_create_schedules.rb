class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :user_id, null: false
      t.integer :schedule_name, null: false
      t.text :caption, null: false
      t.text :schedule, null: false
      t.timestamps
    end
  end
end
