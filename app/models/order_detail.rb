class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  delegate :name, to: :product, prefix: true
end
