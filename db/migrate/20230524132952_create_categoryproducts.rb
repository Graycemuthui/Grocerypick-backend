class CreateCategoryproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :categoryproducts do |t|
      t.references :product, null: false
      t.references :category, null: false
      t.timestamps
    end
  end
end
