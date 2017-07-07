class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    location_id = params[:location_id]
    @location = Location.find_by(id: location_id)
    @post = Post.new
  end

  def create
    location_id = params[:location_id]
    location = Location.find_by(id: location_id)
    new_post = Post.new(post_params)

    if new_post.save

      location.posts << new_post
      redirect_to location_post_path
    else
      explode
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    redirect_to user_post_path
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
