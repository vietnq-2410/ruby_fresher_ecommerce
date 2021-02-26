class Api::V1::UsersController < ApplicationController
  before_action :load_user, only: %i(show update)
  before_action :authorized, only: :auto_login


  def index
    @users = User.sort_desc
    render json: {
      status: true,
      data: UserSerializer.new(@users).serializable_hash
    }, 
    status: :ok
  end

  def show
    render json: {
      status: true,
      data: load_user_serializer_data
    },
    status: :ok
  end

  def create
    @user = User.create user_params
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def auto_login
    render json: @user
  end

  def update
    if @user.update user_params
      render json: {
        status: true,
        data: load_user_serializer_data
      }, 
      status: :created
    else
      render json: {
        status: false,
        error: @user.errors
      }, 
      status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: {
      status: true,
      data: load_user_serializer_data
    },
    status: :okcurrent_user
    render json: {
      status: false,
      message: "User not found"
    },
    status: :not_found
  end

  def user_params
    params.permit :name, :email, :password, :password_confirmation
  end

  def load_user_serializer_data
    UserSerializer.new(@user).serializable_hash
  end
end
