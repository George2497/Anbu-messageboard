class ChangeDescriptionToTextInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :description, :text
  end
end
