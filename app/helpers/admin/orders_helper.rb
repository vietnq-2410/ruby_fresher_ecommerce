module Admin::OrdersHelper
  def get_list_order
    Order.sort_desc.paginate(page: params[:page],
      per_page: Settings.paginate)
  end

  def subtotal_order_admin qty, price
    number_to_currency(qty * price)
  end

  def total_order_admin
    ship_price = t("ship_price.#{@order.ship_method}")
    sum_total = 0
    @order.order_details.each do |ord|
      sum_total += ord.quantity * ord.price
    end
    number_to_currency(sum_total + ship_price)
  end

  def option_for_status
    [
      [t("orders.status.waiting"), Settings.order.status.waiting],
      [t("orders.status.confirmed"), Settings.order.status.confirmed],
      [t("orders.status.delivering"), Settings.order.status.delivering],
      [t("orders.status.finish"), Settings.order.status.finish],
      [t("orders.status.cancelled"), Settings.order.status.cancelled]
    ]
  end

  def option_for_payment_status
    [
      [t("orders.payment_status.unpaid"), Settings.order.payment_status.unpaid],
      [t("orders.payment_status.paid"), Settings.order.payment_status.paid]
    ]
  end
end
