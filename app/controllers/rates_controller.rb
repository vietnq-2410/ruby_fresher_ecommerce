class RatesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_loggin?

  def create
    @rate = Rate.new(
      user_id: @current_user.id,
      product_id: params[:product_id],
      rate: params[:rate]
    )

    if @rate.save
      respond_to do |format|
        format.html { redirect_to product_path(params[:product_id]) }
        format.js
      end
    else
      flash[:danger] = t "message.rate_failed"
      redirect_to product_path(params[:product_id])
    end
  end

  private

  def require_loggin?
    return @current_user if logged_in?

    flash[:warning] = t "message.must_login"
    redirect_to login_path
  end
end
