class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    location_id = params[:locations_id]
    @location = Location.find_by(id: location_id)
    @post = Post.new( {locations_id: location_id} )
  end

  def create
    location_id = params[:location_id]
    @location = Location.find_by(id: location_id)
    actual_params = post_params
    actual_params[:locations_id] = location_id
    actual_params[:users_id] = session[:user_id]
    new_post = Post.new(actual_params)

    if new_post.save
      location.posts << new_post
      redirect_to location_post_path(location_id)
    else render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    redirect_to location_post_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to location_post_path
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
