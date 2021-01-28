class Product < ApplicationRecord
  belongs_to :category
  delegate :name, to: :category, prefix: true
  scope :sort_desc, ->{order(created_at: :desc)}
  scope :by_ids, ->(id){where(id: id)}
end
