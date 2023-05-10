class ChangeTheProductQuantityToString < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :product_quantity, :string
  end
end
