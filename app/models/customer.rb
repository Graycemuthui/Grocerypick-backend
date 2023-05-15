class Customer < ApplicationRecord
  has_many :orders
  validates :customer_name, presence: true
  validates :customer_address, presence: true
  validates :customer_phone, presence: true
  validates :customer_email, presence: true
  validates :customer_state, presence: true
  validates :customer_city, presence: true
  validates :customer_zip, presence: true
end
