class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  delegate :name, to: :user, prefix: true
end
