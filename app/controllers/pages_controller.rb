class PagesController < ApplicationController
  before_action :get_filter, only: :store

  def index; end

  def store
    return unless @params.present? && @filter.present?

    @filter_message = t("message.filter_result.#{@params}",
                        name: params[:search],
                        category: @filter.first.category_name)
  end

  def block; end

  def suggest; end

  def favorites; end

  private

  def get_filter
    @params = params[:filter]
    @filter = if @params == "price_desc"
                Product.sort_price(:desc)
              elsif @params == "price_asc"
                Product.sort_price(:asc)
              elsif @params == "by_category"
                Product.by_category(params[:category])
              elsif @params == "search_by_name"
                Product.by_name(params[:search])
              else
                Product.sort_desc
              end.paginate(page: params[:page], per_page: Settings.paginate)
  end
end
