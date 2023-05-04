class Payment < ApplicationRecord
  belongs_to :order
  validates :payment_method, presence: true
  validates :payment_amount, presence: true
  validates :payment_date, presence: true
end
