class AddFkToPayments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :payments, :orders, column: :order_id
  end
end
