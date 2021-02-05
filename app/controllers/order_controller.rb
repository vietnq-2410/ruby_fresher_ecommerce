class OrderController < ApplicationController
  before_action :require_loggin
  before_action :load_customer_name, :load_order_new, only: :create

  def index
    @cart = session[:cart]
  end

  def create
    Order.transaction do
      save_order!
    end
    OrderMailer.send_order(@order).deliver
    flash[:success] = t "message.order_success"
    session[:cart].clear
    redirect_to cart_index_path
  rescue ActiveRecord::Rollback
    flash[:danger] = t "message.order_fail"
    redirect_to cart_index_path
  end

  private

  def load_customer_name
    @customer_name = if params[:customer_name].blank?
                       @current_user.name if logged_in?
                     else
                       params[:customer_name]
                     end
  end

  def save_order!
    session[:cart].each do |pro_id, qty|
      product = Product.find_by id: pro_id
      if product.blank?
        flash[:info] = t "message.product_not_exits"
        session[:cart].clear
        redirect_to root_path
      else
        @order.order_details.build product_id: pro_id,
                                  quantity: qty,
                                  price: product.price
      end
    end
    @order.save!
  end

  def load_order_new
    @order = @current_user.orders.new(
      customer_name: @customer_name,
      phone: params[:phone],
      address: params[:address],
      ship_method: params[:ship_method],
      pay_method: params[:pay_method],
      note: params[:note]
    )
  end

  def require_loggin
    redirect_to login_path unless logged_in?
  end
end
