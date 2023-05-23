class Category < ApplicationRecord
  has_many :products
  # validates :category_name, presence: true
  # validates :category_image, presence: true, allow_blank: true
end
