class AddFkToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :order, foreign_key: true
  end
end
