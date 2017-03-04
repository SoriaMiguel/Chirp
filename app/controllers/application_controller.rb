class ApplicationController < ActionController::API

  # before

  def current_user
    @current_user ||= User.find_by(api_token: params[:api_token])
  end


  def require_user
   unless current_user
     render json: ["You need to be logged in to do this."], status: 401
   end
  end
  #find the user by it's api token
end
