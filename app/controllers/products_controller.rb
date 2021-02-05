class ProductsController < ApplicationController
  before_action :load_product, :up_view_product, :get_id_viewed

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

  def get_id_viewed
    session[:viewed] ||= []
    session[:viewed] << @product
    session[:viewed].shift if session[:viewed].count > 5
  end
end
