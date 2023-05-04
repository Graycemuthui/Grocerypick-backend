class Order < ApplicationRecord
  belongs_to :customer
  validates :order_total, presence: true
  validates :order_quantity, presence: true
  validates :order_date, presence: true
end
