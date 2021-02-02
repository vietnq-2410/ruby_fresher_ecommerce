class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details
  belongs_to :user
  enum status: {waiting: 0,
                confirmed: 1,
                delivering: 2,
                finish: 3,
                cancelled: 4}
  enum payment_status: {unpaid: 0, paid: 1}
  validates :phone, presence: true
  validates :address, presence: true
  validates :ship_method, presence: true
  validates :pay_method, presence: true
  scope :sort_desc, ->{order(created_at: :desc)}
end
