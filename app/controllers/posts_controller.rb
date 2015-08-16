class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to @post
    else
      render "new"
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
