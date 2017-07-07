class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)

    if post.save
      redirect_to user_post_path(post)
    else render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    redirect_to user_post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_posts_path
  end


  def show
    @post = Post.find(params[:id])
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
