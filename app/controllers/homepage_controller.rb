class HomepageController < ApplicationController

  def index
    @locations = Location.all
  end

end
