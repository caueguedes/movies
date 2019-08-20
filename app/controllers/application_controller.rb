require 'swapi'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def home
    @movies = Swapi.fetchAll
    # puts @movies["results"][1] 
  end

  # def details
  #   @details = Swapi.fetch(params[:id])
  # end
end
