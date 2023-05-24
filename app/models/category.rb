class Category < ApplicationRecord
  has_many :products, through: :category_products
  has_many :category_products
  validates :category_name, presence: true
  validates :category_image, presence: true
end
