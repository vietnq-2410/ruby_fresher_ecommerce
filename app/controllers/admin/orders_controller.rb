class Admin::OrdersController < Admin::AdminsController
  authorize_resource
  before_action :load_order, except: :index

  def index; end

  def update
    @order.status = params[:status].to_i
    @order.payment_status = params[:payment_status].to_i
    if @order.save
      flash[:success] = t "message.update_success"
    else
      flash[:danger] = t "message.update_failed"
    end
    redirect_to admin_order_path(@order)
  end

  def show; end

  private

  def load_order
    @order = Order.find_by(id: params[:id])
    return if @order

    flash[:danger] = t "message.order_not_exist"
    redirect_to admin_orders
  end
end
