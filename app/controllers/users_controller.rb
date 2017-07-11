class UsersController < ApplicationController
  before_action :current_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      flash.now[:danger] = @user.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    user = User.friendly.find(params[:id])
    user.update_attributes(user_params)
    redirect_to user_path(user)
  end

  def destroy
    user = User.friendly.find(params[:id])
    user.destroy
    redirect_to root_path
  end


  def show
    @user = User.friendly.find(params[:id])
    # @posts = Post.where(user_id: @user.id)
    @posts = Post.joins(:user).select('posts.*, users.name').where(user_id: @user.id)
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :current_location, :email, :password, :photo)
  end

end
