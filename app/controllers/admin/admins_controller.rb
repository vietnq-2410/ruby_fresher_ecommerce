class Admin::AdminsController < ApplicationController
  authorize_resource class: Admin::AdminsController

  layout "admins"

  def dashboard; end
end
