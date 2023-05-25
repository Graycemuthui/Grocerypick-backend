class Product < ApplicationRecord
  has_many :orders
  has_many :categories, through: :category_products
  has_many :category_products
  attribute :category, :string
  validates :product_name, presence: true
  validates :product_price, presence: true
  validates :product_description, presence: true
  validates :product_image, presence: true
  validates :product_quantity, presence: true
  validates :category_id, presence: true
end
