class CreatePostCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :post_categories do |t|
      t.integer "post_id"
      t.integer "category_id"
      t.index["post_id"], name: "index_post_categories_on_post_id"
      t.index["category_id"], name: "index_post_categories_on_category_id"
      t.timestamps
    end
  end
end
