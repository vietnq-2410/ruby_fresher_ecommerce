class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_request!

  def index
    @users = User.sort_desc

    render json: {
      status: true,
      data: ActiveModelSerializers::SerializableResource.new(@users)
    },
    status: :ok
  end
end
