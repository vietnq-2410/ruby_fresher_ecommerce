class PagesController < ApplicationController
  def index
    @products = Product.sort_desc.paginate(page: params[:page],
      per_page: Settings.paginate)
  end

  def store; end

  def block; end

  def suggest; end

  def favorites; end
end
