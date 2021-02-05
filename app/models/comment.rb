class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  delegate :name, to: :user, prefix: true
  scope :sort_desc, ->{order(created_at: :desc)}
end
