class ApplicationController < ActionController::API
  before_action :authorize_request, except: [:create, :login]

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header.present?
    begin
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)
      @current_user = User.find(decoded_token[0]['user_id'])
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end

end
