class LocationsController < ApplicationController

  def index
    @locations = Location.order('id')
  end

  def new
    @location = Location.new
  end

  def create
    location = Location.new(location_params)

    if location.save
      redirect_to location_path(location)
    else render :new
    end
  end

  def edit
    @location = Location.friendly.find(params[:id])
  end

  def update
    location = Location.friendly.find(params[:id])
    location.update_attributes(location_params)
    redirect_to location_path(location)
  end

  def destroy
    location = Location.friendly.find(params[:id])
    location.destroy
    redirect_to locations_path
  end

  def show
    location_id = params[:location_id]
    @location = Location.friendly.find(params[:id])
    # @posts = Post.order('id')
    @posts = Post.joins(:user).select('posts.*, users.name').where(location_id: @location.id)
    render :show
  end

  private
  def location_params
    params.require(:location).permit(:city, :state, :country, :region, :photo, :lat, :long)
  end

end
