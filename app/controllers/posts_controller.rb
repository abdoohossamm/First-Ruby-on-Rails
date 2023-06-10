class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Rails.cache.fetch("post_#{params[:id]}", expires_in: 1.hour) do
      Post.find(params[:id])
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append("posts", @post) }
        format.html { redirect_to posts_path }
      end
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end