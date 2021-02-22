class ProductsController < ApplicationController
  authorize_resource
  before_action :load_product
  before_action :up_view_product
  def show
    @products_same_category = Product.by_category(@product.category_id)
  end

  private

  def load_product
    @product = Product.find_by(id: params[:id])
    return if @product

    flash[:danger] = t "message.product_not_exits"
    redirect_to root_path
  end

  def up_view_product
    @product.view += 1
    @product.save
  end
end
