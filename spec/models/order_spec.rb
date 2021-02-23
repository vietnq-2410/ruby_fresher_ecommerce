require "rails_helper"

RSpec.describe Order, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:order_details).dependent(:destroy) }
    it { should have_many(:products).through(:order_details) }
  end

  describe "Nested attribute" do
    it { should accept_nested_attributes_for(:order_details) }
  end

  describe "scopes" do
    it ".sort_desc returns all orders newest" do
      expect(Order.sort_desc).to eq(Order.order(created_at: :desc))
    end
  end

  describe "validates" do
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:ship_method) }
    it { should validate_presence_of(:pay_method) }
  end

  describe "enum" do
    it do
      should define_enum_for(:status)
    end
    it do
      should define_enum_for(:payment_status)
    end
  end
end
