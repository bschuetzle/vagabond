class HomepageController < ApplicationController

  def index
    @locations = Location.all
    @first_location = Location.first
    @last_location = Location.last
  end

end
