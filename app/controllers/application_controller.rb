class ApplicationController < ActionController::API
  include Pundit::Authorization

  before_action :authorize_request, unless: :skip_authorization?
  helper_method :current_user

  private
  
  def current_user
    @current_user
  end
  
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

  def skip_authorization?
    (params[:controller] == 'users' && ['create', 'login'].include?(params[:action]))
  end
end
