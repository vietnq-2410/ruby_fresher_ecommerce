module ProductsHelper
  def calculator_old_price
    number_to_currency(@product.price / ((100 - @product.sale) * 0.01))
  end
end
