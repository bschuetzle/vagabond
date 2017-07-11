class NavController < ApplicationController

  def _header
    @user = User.friendly.find(params[:id])
  end
  
end
