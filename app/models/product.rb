class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  delegate :name, to: :category, prefix: true
  scope :sort_desc, ->{order(created_at: :desc)}
  scope :by_ids, ->(id){where(id: id)}
end
