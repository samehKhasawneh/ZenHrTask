class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render json: { user:, token: generate_token(user.id) }, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # Custom action for user login
  # POST /login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: { user:, token: generate_token(user.id) }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def generate_token(user_id)
    JWT.encode({ user_id: }, Rails.application.credentials.secret_key_base)
  end
end
