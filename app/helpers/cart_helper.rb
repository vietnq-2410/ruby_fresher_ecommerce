module CartHelper
  def get_product_name pro_id
    Product.find_by(id: pro_id)&.name
  end

  def get_product_price pro_id
    Product.find_by(id: pro_id)&.price
  end

  def count_item
    @cart.sum{|_pro_id, quantity| quantity.to_i}
  end

  def subtotal
    sum = 0
    products = Product.by_ids(@cart.map(&:first))
    @cart.each do |pro_id, qty|
      product = products.find{|pro| pro.id == pro_id.to_i}
      next unless product

      sum += (product.price * qty).to_i
    end
    sum
  end
end
