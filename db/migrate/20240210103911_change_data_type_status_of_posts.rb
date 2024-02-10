class ChangeDataTypeStatusOfPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :status, :string
  end
end
