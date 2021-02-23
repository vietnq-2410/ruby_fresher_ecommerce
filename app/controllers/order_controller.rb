class OrderController < ApplicationController
  before_action :authenticate_user!
  before_action :load_customer_name, :load_params, only: :create

  def index
    @cart = session[:cart]
  end

  def create
    Order.transaction do
      save_order!
    end
    flash[:success] = t "message.order_success"
    session[:cart].clear
    redirect_to cart_index_path
  rescue ActiveRecord::Rollback
    flash[:danger] = t "message.order_fail"
    redirect_to cart_index_path
  end

  private

  def load_customer_name
    @customer_name = params[:customer_name].presence || current_user.name
  end

  def load_order_details
    @order_details ||= []
    session[:cart].each do |pro_id, qty|
      product = Product.find_by id: pro_id
      if product.blank?
        flash[:info] = t "message.product_not_exits"
        session[:cart].clear
        redirect_to root_path
      else
        @order_details << {
          product_id: pro_id,
          quantity: qty,
          price: product.price
        }
      end
    end
  end

  def save_order!
    @order = current_user.orders.create(@order_params)
    @order.save!
  end

  def load_params
    load_order_details
    @order_params = {
      customer_name: @customer_name,
      phone: params[:phone],
      address: params[:address],
      ship_method: params[:ship_method],
      pay_method: params[:pay_method],
      note: params[:note],
      order_details_attributes: @order_details
    }
  end
end
