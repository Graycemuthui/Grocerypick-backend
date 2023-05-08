class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: %i[create]

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { error: 'Error creating user' }
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user) },
           status: :accepted
  end

  private

  def user_params
    params.require(:username).permit(:username, :email, :password)
  end
end
