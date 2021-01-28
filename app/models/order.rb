class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  belongs_to :user
  validates :phone, presence: true
  validates :address, presence: true
  validates :ship_method, presence: true
  validates :pay_method, presence: true
end
