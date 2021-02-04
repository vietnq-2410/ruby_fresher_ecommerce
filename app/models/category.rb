class Category < ApplicationRecord
  has_many :product, dependent: :destroy
  has_many :children, dependent: :destroy,
    class_name: Category.name, foreign_key: :parent_id
  belongs_to :parent, class_name: Category.name, optional: true
end
