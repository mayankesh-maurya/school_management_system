class HomeController < ApplicationController
  skip_before_action :authenticate_school_user!
  def index
    
  end
end
