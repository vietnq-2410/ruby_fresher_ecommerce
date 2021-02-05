module RatesHelper
  def check_exist_rate? product_id
    user = @current_user if logged_in?
    if user.rates.find_by(product_id: product_id)
      return true
    else
      return false
    end
  end

  def get_rate_by_product product_id
    user = @current_user if logged_in?
    user.rates.find_by(product_id: product_id).rate
  end
end
