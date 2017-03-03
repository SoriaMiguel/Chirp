class PostsController < ApplicationController


# GET /posts
  def index
    if current_user
      @post = Post.timeline(current_user)
    else
      @post = Post.all
    end
    render json: @post
  end



# POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: 400
    end
  end



  private

  def post_params
    params.permit(:body)
  end
end
