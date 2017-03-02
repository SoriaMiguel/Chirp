class PostsController < ApplicationController

  def index
    @post = Post.all

  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: 422
    end
  end


  private

  def post_params
    params.permit(:body, :user_id)
  end
end
