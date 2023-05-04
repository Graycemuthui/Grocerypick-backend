class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :qunatity
      t.string :image_url

      t.timestamps
    end
  end
end
