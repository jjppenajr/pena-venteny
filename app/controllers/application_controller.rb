class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user

  attr_reader :current_user
  helper_method :current_user
private
  def authenticate_user
    @current_user = nil
    result = AuthenticateApiRequest.call(request.headers).result
    @current_user = result
    params[:user_id] = @current_user&.id
    render json: { error: 'Not Authorized' }, status: 401 unless @current_account
  end
end