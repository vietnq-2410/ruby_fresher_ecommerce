class Admin::AdminsController < ApplicationController
  layout "admins"
  before_action :require_loggin?
  before_action :require_admin?

  def dashboard; end

  private

  def require_admin?
    return if @current_user.admin?

    flash[:danger] = t "message.not_admin"
    redirect_to root_path
  end

  def require_loggin?
    return if logged_in?

    flash[:danger] = t "message.must_loggin"
    redirect_to login_path
  end
end
