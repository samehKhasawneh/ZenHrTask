class ApplicationController < ActionController::API
  before_action :authorize_request, unless: :login_action?

  private

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

  def login_action?
    # puts "All params: #{params.inspect}"
    params[:controller] == 'users' && params[:action] == 'login'
  end
end
