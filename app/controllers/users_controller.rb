class UsersController < ApplicationController

before_action :require_user, only: [:follow, :unfollow]

# GET /users
  def index
    @user = User.all
    render json: @user
  end

#GET /login
  def login
    @user = User.find_by(username: params[:username]).&authenticate(params[:password])
    if @user
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end


#POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  def following
    # binding.pry
    @followees = User.find(params[:id]).followees(User)
    render json: @followees
  end

#POST /unfollow
  def unfollow
    if current_user.follows?(User.find(params[:id]))
      current_user.toggle_follow!(User.find(params[:id]))
      render json: ["#{current_user.username} is no longer following #{User.find(params[:id]).username}"]
    else
        render json: ["#{current_user.username} was never following #{User.find(params[:id]).username}"]
    end
  end


#POST /follow
  def follow
    if current_user.follows?(User.find(params[:id]))
      render json: ["#{current_user.username} is already following #{User.find(params[:id]).username}"]
    else
      current_user.toggle_follow!(User.find(params[:id]))
      render json: ["#{current_user.username} is now following #{User.find(params[:id]).username}"]
    end
    #find the current user by it's api token, once you've found it, toggle it to be folowed based on the current user :id
    #since we're not actually doing anything to the current user, just give us the current user
  end



  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   render json: @user
  # end

private

def user_params
  params.permit(:name, :username, :password, :email)
end


end
