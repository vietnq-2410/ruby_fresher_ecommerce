module PagesHelper
  def get_trending_products
    Product.sort_view
  end

  def get_categories
    Category.select(:id, :name, :parent_id)
  end
end
