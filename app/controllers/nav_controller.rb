class NavController < ApplicationController
  def _header
        @user = User.find(params[:id])
  end
end
