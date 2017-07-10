class PostsController < ApplicationController
  def index
    # @posts = Post.all
    location_id = params[:location_id]
    @posts = Post.order('id')
    @location = Location.friendly.find_by(id: location_id)
  end

  def new
    location_id = params[:location_id]
    @location = Location.friendly.find_by(id: location_id)
    @post = Post.new( {location_id: location_id} )
  end

  def create
    location_id = params[:location_id]
    actual_params = post_params
    actual_params[:location_id] = location_id
    actual_params[:user_id] = session[:user_id]
    @location = Location.friendly.find_by(id: location_id)
    @post = Post.new(actual_params)
    if @post.save

      @location.posts << @post
      redirect_to location_post_path(location_id, @post)
    else render :new
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    location_id = params[:location_id]
    post = Post.friendly.find(params[:id])
    post.update_attributes(post_params)
    redirect_to location_post_path
  end

  def destroy
    post = Post.friendly.find(params[:id])
    post.destroy
    redirect_to location_posts_path
  end

  def show
    @post = Post.joins(:user).select('posts.*, users.name').friendly.find(params[:id])
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
