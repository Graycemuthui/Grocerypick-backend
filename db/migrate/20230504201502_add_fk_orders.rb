class AddFkOrders < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :orders, :customer, column: :customer_id
    add_foreign_key :orders, :payments, column: :payment_id
  end
end
