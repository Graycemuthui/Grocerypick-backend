class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'my_secret')
  end

  def create
    user = User.new(user_params)
    if user.save token = encode_token({ user_id: user.id })
      render json: { user: UserSerializer.new(user), token: }
    else
      render json: { error: 'Error creating user' }
    end
  end
end
