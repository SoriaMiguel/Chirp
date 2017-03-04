class SessionsController < ApplicationController

# POST /signin
  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if @user
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: ["User not found."], status: 401
    end
  end


end
