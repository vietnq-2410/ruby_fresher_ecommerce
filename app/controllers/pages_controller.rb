class PagesController < ApplicationController
  def index; end

  def store
    @search = Product.ransack(params[:q], auth_object: set_ransack_auth_object)
    @products = if params[:filter] == Settings.search_by_category
                  Product.by_category(params[:category])
                else
                  @products = @search.result.includes(:category)
                end.page(params[:page]).per_page(Settings.paginate)
  end

  def block; end

  def suggest; end

  def favorites; end

  private

  def set_ransack_auth_object
    return unless current_user

    current_user.admin? ? :admin : nil
  end
end
