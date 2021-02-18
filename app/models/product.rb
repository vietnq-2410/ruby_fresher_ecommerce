class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  delegate :name, to: :category, prefix: true

  ransacker :created_at, type: :date do
    Arel.sql("date(created_at)")
  end

  scope :sort_desc, ->{order(created_at: :desc)}
  scope :by_ids, ->(id){where(id: id)}
  scope :by_category, ->(category_id){where("category_id = ?", category_id)}
  scope :sort_view, ->{order(view: :desc).limit Settings.trending_products}

  def self.ransackable_attributes auth_object = nil
    if auth_object == :admin
      super
    else
      super & %w(name description price)
    end
  end
end
