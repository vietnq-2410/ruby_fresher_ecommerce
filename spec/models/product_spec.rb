require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Associations" do
    it { should belong_to(:category) }
    it { should have_many(:order_details).dependent(:destroy) }
    it { should have_many(:orders).through(:order_details) }
  end

  describe "Delegate" do
    it { should delegate_method(:name).to(:category).with_prefix true }
  end

  describe "scopes" do
    it ".sort_desc returns all product newest" do
      expect(Product.sort_desc).to eq(Product.order(created_at: :desc))
    end
    it ".by_ids return by list id" do
      id = 1
      expect(Product.by_ids(id)).to eq(Product.where(id: id))
    end
    it ".by_category return by same category" do
      category_id = 1
      expect(Product.by_category(category_id)).to match_array(Product.where(category_id: category_id))
    end
    it ".sort_view rerurn all product viewest" do
      expect(Product.sort_view).to eq(Product.order(view: :desc).limit Settings.trending_products)
    end
  end
end
