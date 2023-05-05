class AddFkToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :customer, foreign_key: true
    add_reference :orders, :payment, foreign_key: true
  end
end
