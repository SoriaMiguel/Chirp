class ApplicationController < ActionController::API

  def current_user
    @current_user ||= User.find_by(api_token: params[:api_token])
  end

  #find the user by it's api token
end
