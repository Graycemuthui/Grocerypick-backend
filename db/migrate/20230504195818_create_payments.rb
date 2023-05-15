class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :payment_amount
      t.date :payment_date
      t.text :payment_method

      t.timestamps
    end
  end
end
