class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.post.build(title: params[:title], body: params[:body])

    if @post.save
      redirect_to posts_url
    else
      render :new
    end
  end
end
