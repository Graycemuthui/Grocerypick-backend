class AddNotNullToCategoryname < ActiveRecord::Migration[7.0]
  def change
    change_column_null :categories, :category_name, false
    change_column_null :categories, :category_image, false
  end
end
