class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :authorized
  
  # protect_from_forgery with: :exception

  def encode_token(payload)
    JWT.encode(payload, "yourSecret")
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    if auth_header
      token = auth_header.split(" ")[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, "yourSecret", true, algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
