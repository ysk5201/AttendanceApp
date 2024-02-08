class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :employee_id
      t.boolean :status
      t.time :break_time

      t.timestamps
    end
  end
end
