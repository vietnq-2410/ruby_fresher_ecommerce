class CartController < ApplicationController
  before_action :load_product, only: :update

  def index
    @cart = session[:cart]
  end

  def create
    session[:cart] ||= {}

    product_id = params[:product_id]
    session[:cart][product_id] = if session[:cart].key?(product_id)
                                   session[:cart][product_id] += 1
                                 else
                                   1
                                 end

    respond_to do |format|
      format.html{redirect_to cart_index_path}
      format.js
    end
  end

  def update
    session[:cart][params[:id]] = params[:qty].to_i
    flash[:success] = t "message.cart_update_success"
    redirect_to cart_index_path
  end

  def remove_cart_item
    session[:cart].delete params[:id].to_s
    flash[:success] = t "message.cart_deleted"
    redirect_to cart_index_path
  end

  def remove_all_item
    session[:cart].clear
    flash[:success] = t "message.cart_deleted"
    redirect_to cart_index_path
  end

  private

  def load_product
    product = Product.find_by id: params[:id]

    return if product

    flas[:warning] = t "message.error_to_page"
    redirect_to cart_index_path
  end
end
