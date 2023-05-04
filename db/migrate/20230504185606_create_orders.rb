class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :order_total
      t.integer :order_quantity
      t.date :order_date

      t.timestamps
    end
  end
end
