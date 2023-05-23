class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :orders
  validates :product_name, presence: true
  validates :product_price, presence: true
  validates :product_description, presence: true
  validates :product_image, presence: true
  validates :product_quantity, presence: true
  validates :category, presence: true
end
