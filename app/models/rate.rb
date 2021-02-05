class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :product
  scope :by_user, ->(user_id){where("user_id = ?", user_id)}
end
