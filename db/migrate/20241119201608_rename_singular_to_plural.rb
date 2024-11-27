class RenameSingularToPlural < ActiveRecord::Migration[7.1]
  def change
    rename_table :category, :categories
  end
end
