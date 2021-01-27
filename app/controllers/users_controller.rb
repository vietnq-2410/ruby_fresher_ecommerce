class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :load_user, only: :show

  def show; end

  private

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "message.alert_login"
    redirect_to login_url
  end

  def load_user
    return if @user = User.find_by(id: params[:id])

    flash[:warning] = t("message.user_warning")
    redirect_to root_path
  end
end
